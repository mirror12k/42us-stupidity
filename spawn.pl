#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



sub slurp_file {
	my ($file) = @_;

	warn "error opening file $file" and return unless open my $f, '<', $file;
	local $/;
	my $contents = <$f>;
	$f->close;
	
	return $contents
}

sub dump_file {
	my ($file, $contents) = @_;
	
	# warn "creating file $file\n";

	open my $f, '>', $file;
	$f->print($contents);
	$f->close;
}

sub append_file {
	my ($file, $contents) = @_;

	# warn "appending file $file\n";

	open my $f, '>>', $file;
	$f->print($contents);
	$f->close;
}

sub mirror_file {
	my ($file, $destination) = @_;
	my $contents = slurp_file($file);
	dump_file($destination, $contents);
}

sub get_given_function_prototype {
	my ($function, $content) = @_;

	my @protos = split /\r?\n/, $content;
	foreach my $proto (@protos) {
		if ($proto =~ /\A\S+\s+\**(\w+)\(.*\);?\Z/) {
			return $proto if $1 eq $function;
		}
	}
	warn "prototype not found for function $function";
	return
}

sub parse_function_ref {
	my ($function) = @_;

	my ($function_name, $function_proto);
	if ($function =~ /\A(\w+)\Z/) {
		$function_name = $1;
		$function_proto = "void	$function_name(void)";
	} elsif ($function =~ /\A(\w+)\((.*)\)\Z/) {
		$function_name = $1;
		$function_proto = "void	$function_name($2)";
	} elsif ($function =~ /\A(.*?) (\w+)\((.*)\)\Z/) {
		$function_name = $2;
		$function_proto = "$1	$function_name($3)";
	} else {
		die "invalid function name: $function";
	}

	return $function_name, $function_proto
}

sub read_file_from_config {
	my ($config, $break) = @_;
	$break = quotemeta $break;
	my $result = '';
	until ($config->[0] =~ /\A$break(?:\s+(.+))?\Z/) {
		die "end of file while looking for break: $break" unless @$config;
		$result .= shift @$config;
		$result .= "\n";
	}

	if ($config->[0] =~ /\A$break(?:\s+(.+))\Z/) {
		$config->[0] = $1;
	} else {
		shift @$config;
	}

	return $result
}

sub parse_flags {
	my ($flags) = @_;
	return map {
			if (/\A(\w)=(.*)\Z/) {
				$1 => $2
			} else {
				$_ => 1
			}
		} map s/\A-//r, split ' ', $flags
}

sub main {
	my ($project_directory, $config_file) = @_;

	die "project_directory required" unless defined $project_directory;
	die "config file required" unless defined $config_file;

	mkdir 'tools';
	mkdir 'work';

	dump_file('tools/build.sh', "#!/bin/sh\n\n");
	dump_file('tools/verify.sh', "#!/bin/sh\n\n norminette -R CheckForbiddenSourceHeader");
	dump_file('tools/check_all.sh', "#!/bin/sh\n\n");

	chmod 0755, 'tools/build.sh', 'tools/verify.sh', 'tools/check_all.sh';

	my @config = grep $_ ne '', split /\r?\n/, slurp_file($config_file);

	while (@config) {
		my $thing = shift @config;
		if ($thing =~ /\A((?:main|check)\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/) {
			(undef) = read_file_from_config(\@config, $3);
			next;
		}
		my $exercise = $thing;
		my $function = shift @config;

		warn "\npreparing $exercise/$function\n";

		my ($function_name, $function_proto) = parse_function_ref($function);
		
		unless (-e -d "$project_directory/$exercise") {
			warn "missing directory $project_directory/$exercise, skipping...";
			next;
		}
		unless (-e -f "$project_directory/$exercise/$function_name.c") {
			warn "missing project file $project_directory/$exercise/$function_name.c, skipping...";
			next;
		}
		my $exercise_contents = slurp_file("$project_directory/$exercise/$function_name.c");
		my $import_proto = get_given_function_prototype($function_name, $exercise_contents);
		unless (defined $import_proto) {
			warn "missing prototype $function_name, skipping...";
			next;
		}
		
		mkdir "work/$exercise";
		
		warn "mirroring into work/$exercise/$function_name.c\n";
		mirror_file("$project_directory/$exercise/$function_name.c", "work/$exercise/$function_name.c");

		append_file('tools/verify.sh', " work/$exercise/$function_name.c");

		while (@config and $config[0] =~ /\A(main\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/) {
			shift @config;
			my $main_file = $1;
			my %main_flags;
			%main_flags = parse_flags($2) if defined $2;
			my $contents = read_file_from_config(\@config, $3);
			warn "$main_file at work/$exercise/$main_file.c\n";

			my $prefix = "
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

$import_proto;

";
			my $suffix = "\n\n";

			if ($main_flags{p}) {
				$contents = eval $contents;
				die "error compiling main -p: $@" if $@;
			}

			if ($main_flags{m}) {
				$prefix .= "int main() {\n";
				$suffix .= "return 0; }\n";
			}
			dump_file("work/$exercise/$main_file.c", "$prefix$contents$suffix");
			append_file('tools/build.sh', "
echo building work/$exercise/$main_file
gcc -Wall -Wextra -Werror stupidity.c work/$exercise/$function_name.c work/$exercise/$main_file.c -o work/$exercise/$main_file
");
			while (@config and $config[0] =~ /\A(check\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/)
			{
				shift @config;
				my $check_file = "$1.pl";
				my %check_flags;
				%check_flags = parse_flags($2) if defined $2;
				my $break = $3;
				warn "$check_file at work/$exercise/$check_file\n";
				
				my $prefix = "\n\n";
				my $suffix = "\n\n";
				my $contents = read_file_from_config(\@config, $break);
				$prefix .= "
my \$count_lines = 0;
my \$errors = 0;
foreach my \$line (grep / -> [01]\\Z/, split /\\n/, \$output) {
	\$count_lines++;
	if (\$line !~ / -> 1\\Z/) {
		say \"!!!! ERROR in work/$exercise/$main_file (line \$count_lines): '\$line'\";
		\$errors++;
	}
	# debug
	# else { say \"passing: '\$line'\"; }
}
if (\$count_lines < $check_flags{l}) {
	say \"!!!! ERROR in work/$exercise/$main_file: expected $check_flags{l} lines, got \$count_lines\";
} elsif (\$errors == 0) {
	say 'work/$exercise/$main_file good!';
}
" if $check_flags{l};
				$suffix .= "
if (\$output eq \$expected) {
	say 'work/$exercise/$main_file good!';
} else {
	say \"!!!! ERROR in work/$exercise/$main_file: '\$output'\";
	say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
}
" if $check_flags{e};
				
				dump_file("work/$exercise/$check_file", "#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my \$output = `./work/$exercise/$main_file`;
my \$expected;
die \"$exercise/$main_file failed to run: \$?\" if \$?;

$prefix
$contents
$suffix
");
				append_file('tools/check_all.sh', "
perl work/$exercise/$check_file
");
			}
		}
	}

}



caller or main(@ARGV);

