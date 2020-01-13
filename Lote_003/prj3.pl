#!c:/Perl/perl.exe -w
#Lista Nomes que começam "A"
use strict;
use warnings;

my @myNames = ('Jacob', 'Michael', 'Joshua', 'Matthew', 'Alexander', 'Andrew');
my @grepNames = grep(/^A/, @myNames); 

foreach my $Nome(@grepNames)
{
  print $Nome. "\n";
}