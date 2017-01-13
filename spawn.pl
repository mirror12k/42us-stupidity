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
	dump_file($contents);
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
	}
	return $result
}

sub main {
	my ($project_directory, $config_file) = @_;

	die "project_directory required" unless defined $project_directory;
	die "config file required" unless defined $config_file;

	dump_file('build.sh', "#!/bin/sh\n\n");
	dump_file('verify.sh', "#!/bin/sh\n\n");
	dump_file('check_all.sh', "#!/bin/sh\n\n");

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
		
		mkdir $exercise;
		
		mirror_file("$project_directory/$exercise/$function_name.c", "$exercise/$function_name.c");

		append_file('verify.sh', "
norminette -R CheckForbiddenSourceHeader $exercise/$function_name.c
");

		while (@config and @config[0] =~ /\A(main\d*) (.*)\Z/) {
			shift @config;
			my $main_file = $1;

			my $contents = read_file_from_config(\@config, $2);
			dump_file("$exercise/$main_file.c", "#include <stdio.h>\n$import_proto;\n\n$contents");
			append_file('build.sh', "
echo building $exercise/$main_file
gcc -Wall -Wextra -Werror stupidity.c $exercise/*.c -o $exercise/$main_file
");
			next unless @config and @config[0] =~ /\A(check\d*) (.*)\Z/;
			shift @config;
			my $check_file = "$1.pl";
			dump_file("$exercise/$check_file", "use strict;\nuse warnings;\nuse feature 'say';\n\n" . read_file_from_config(\@config, $2));
			append_file('check_all.sh', "
perl $exercise/$check_file
");
		}
	}

}



caller or main(@ARGV);

