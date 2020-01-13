#!/usr/bin/perl
#Lista Arquivos do diretorio.

use strict;
use warnings;

my $diretorio = "/httpdocs/bkp/F4Computer/Comprovantes/Impostos";

opendir(DIR, "$diretorio");
my @lista = readdir(DIR);
closedir(DIR);

open(ARQ1,">Arq.html");

#print ARQ1 "Content-type: text/html\n\n";
print ARQ1 "<html><head><title>Listagem de arquivos</title></head>\n";
print ARQ1 "<body><h1>Listagem de Arquivos\n";

foreach my $arquivo(@lista)
{
	unless ( ($arquivo eq ".") || ($arquivo eq "..") ) 
	{ 
	print ARQ1 "<table><td><a href=".$diretorio."/".$arquivo.">".$arquivo."</a></td></table>";	
	} 
}
print ARQ1 "</body></html>\n";

close(ARQ1);