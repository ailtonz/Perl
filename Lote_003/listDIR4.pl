#!c:/Perl/perl.exe -w
#Lista Arquivos do diretorio.

use strict;
use warnings;


my $diretorio = "C:/Tmp/e-Mails/enviados";

opendir(DIR, "$diretorio");
my @lista = readdir(DIR);
closedir(DIR);

open(ARQ1,">Arq.txt");

foreach my $arquivo(@lista)
{
	unless ( ($arquivo eq ".") || ($arquivo eq "..") ) 
	{ 
		print ARQ1 $arquivo. "\n";
	} 
  
}

close(ARQ1);