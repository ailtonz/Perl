#!c:/Perl/perl.exe -w
#Lista Arquivos do diretorio.

use strict;
use warnings;

my $procurar = 'ALLTASKS';
my $diretorio = 'C:/Tmp/e-Mails/enviados';

opendir(DIR, "$diretorio");
my @lista = readdir(DIR);
closedir(DIR);

open(ARQ1,">Arq.html");

#print ARQ1 "Content-type: text/html\n\n";
print ARQ1 "<html><head><title>Listagem de arquivos</title></head>\n";
print ARQ1 "<body><h1>Listagem de Arquivos\n";

my @grepNames = grep(/^$procurar/, @lista); 
foreach my $Nome(@grepNames)
{
	print ARQ1 "<table><td><a href=".$diretorio."/".$Nome.">".$Nome."</a></td></table>";	
}

print ARQ1 "</body></html>\n";

close(ARQ1);