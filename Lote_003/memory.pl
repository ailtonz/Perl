#!/usr/bin/perl -w

use strict;

if ($ARGV[0]){
open STDIN, "bzcat $ARGV[0]|" or die "Cant uncompress file as a
pipe\n$!\n";
}

foreach (<STDIN>) {
chomp;
if ($_ =~ /(somedata)/) {
print "$1\n";
}
}