
use strict;
use warnings;
use URI::Escape;

my $diretorio="C:/Tmp/e-Mails/ENVIADOS";
opendir(IMD, $diretorio) || die("Cannot open directory");
my @thefiles= readdir(IMD);
closedir(IMD);

my $produrar = 'ALLTASKS';

open(ARQ1,">Lista.html");
print ARQ1 "<html><head><title>Listagem de arquivos</title></head>\n";
print ARQ1 "<body><h1>Listagem de Arquivos\n";

my @arquivos = grep(/^$produrar/,@thefiles);
foreach my $f (@arquivos)
{
 unless ( ($f eq ".") || ($f eq "..") )
 { 
      print ARQ1 "<table><td><a href=file:///".$diretorio."/".uri_escape($f).">".$diretorio."/".$f."</a></td></table>";
 }
}

print ARQ1 "</body></html>\n";
close(ARQ1);