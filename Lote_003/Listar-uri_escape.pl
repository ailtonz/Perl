use strict;
use warnings;

my $produrar = 'ALLTASKS';

my @arquivos = grep(/^$produrar/,@thefiles);
foreach my $f (@arquivos)
{
 unless ( ($f eq ".") || ($f eq "..") )
 { 
      print ARQ1 "<table><td><a href=file:///".$diretorio."/".uri_escape($f).">".$diretorio."/".$f."</a></td></table>";
 }
}