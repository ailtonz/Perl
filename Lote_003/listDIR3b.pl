#!c:/Perl/perl.exe -w
#Lista Arquivos do diretorio.

use strict;
use warnings;


my $diretorio = "C:/Tmp/e-Mails/enviados";

my $match = 'Mark';
my @array = ('Jacob', 'Michael', 'Mark', 'Matthew', 'Alexander', 'Andrew');


opendir(DIR, "$diretorio");
my @lista = readdir(DIR);
closedir(DIR);

foreach my $arquivo(@lista)
{
  print qq~$arquivo~. "\n";
}