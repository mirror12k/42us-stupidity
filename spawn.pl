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
	
	say "creating file $file";

	open my $f, '>', $file;
	$f->print($contents);
	$f->close;
}

sub append_file {
	my ($file, $contents) = @_;

	say "appending file $file";

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
		if ($proto =~ /\A\S+\s+(\w+)\(.*\);?\Z/) {
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
	my $result = '';
	my $line = shift @$config;
	while ($line ne $break) {
		$result .= "$line\n";
		$line = shift @$config;
		die "end of file while looking for break: $break" unless defined $line;
	}
	return $result
}

sub main {
	my ($project_directory, $config_file) = @_;

	die "project_directory required" unless defined $project_directory;
	die "config file required" unless defined $config_file;

	mkdir 'tools';
	mkdir 'work';

	dump_file('tools/build.sh', "#!/bin/sh\n\n");
	dump_file('tools/verify.sh', "#!/bin/sh\n\n");
	dump_file('tools/check_all.sh', "#!/bin/sh\n\n");

	chmod 0755, 'tools/build.sh', 'tools/verify.sh', 'tools/check_all.sh';

	my @config = grep $_ ne '', split /\r?\n/, slurp_file($config_file);

	while (@config) {
		my $exercise = shift @config;
		my $function = shift @config;

		warn "preparing $exercise/$function\n";

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
		
		mirror_file("$project_directory/$exercise/$function_name.c", "work/$exercise/$function_name.c");

		append_file('tools/verify.sh', "
norminette -R CheckForbiddenSourceHeader work/$exercise/$function_name.c
");

		while (@config and $config[0] =~ /\A(main\w*) (=.*=)\Z/) {
			shift @config;
			my $main_file = $1;

			my $contents = read_file_from_config(\@config, $2);
			dump_file("work/$exercise/$main_file.c", "#include <stdio.h>\n$import_proto;\n\n$contents");
			append_file('tools/build.sh', "
echo building work/$exercise/$main_file
gcc -Wall -Wextra -Werror stupidity.c work/$exercise/$function_name.c work/$exercise/$main_file.c -o work/$exercise/$main_file
");
			next unless @config and $config[0] =~ /\A(check\w*)(?: (-\w(?: -\w)*))? (=.*=)\Z/;
			shift @config;
			my $check_file = "$1.pl";
			my %flags;
			%flags = map { $_ => 1 } map s/\A-//r, split ' ', $2 if defined $2;
			my $break = $3;
			dump_file("work/$exercise/$check_file", "#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my \$output = `./work/$exercise/$main_file`;
my \$expected;
die \"$exercise/$main_file failed to run: \$?\" if \$?;
" . read_file_from_config(\@config, $break)
. ( $flags{e} ? "if (\$output eq \$expected)\n" : '' )
. "
{ say 'work/$exercise/$main_file good!'; }
else { say \"!!!! ERROR in work/$exercise/$main_file: '\$output'\"; say \"!!!! EXPECTED: '\$expected'\" if defined \$expected; }
");
			append_file('tools/check_all.sh', "

perl work/$exercise/$check_file
");
		}
	}

}



caller or main(@ARGV);

