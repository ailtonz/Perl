#!c:/Perl/perl.exe -w

use strict;
use warnings;


my $Lista = 'ler.txt';

BKP($Lista);

sub BKP{
	
	open(my $file, q{<}, $_[0]);				
	foreach my $arquivo ( <$file> ) {			
	   chomp($arquivo);  						
	   
	   print $arquivo;
	   
	}
	}