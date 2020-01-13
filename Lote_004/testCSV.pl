#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;

my $file = 'C:/tmp/AILTON.csv';

my $csv = Text::CSV->new();

open (CSV, "<", $file) or die $!;
open (ARQ, ">>SAIDA.TXT");

while (<CSV>) {
	if ($csv->parse($_)) {
		my @columns = $csv->fields();
		print ARQ "@columns\n";
	} else {
		my $err = $csv->error_input;
		print ARQ "Failed to parse line: $err";
	}
}
close CSV;
close ARQ;