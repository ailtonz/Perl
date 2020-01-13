If ($ENV{'REQUEST_METHOD'} NE 'POST')
{
print <<"HTML";
<HTML>
<HEAD>
<TITLE>Lamento!</TITLE>
</HEAD>
<BODY>
<H1>Uso de Método Errado!</H1>
Lamento, mas só utilizamos o método POST aqui.
</BODY>
</HTML>
HTML
exit;
}
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{($name, $value) = split(/=/, $pair);
$value =~ tr/+/ /;
$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$form{$name} = $value;
}

use strict;
use warnings;
use URI::Escape;

my $diretorio="C:/Tmp/e-Mails/ENVIADOS";
opendir(IMD, $diretorio) || die("Cannot open directory");
my @thefiles= readdir(IMD);
closedir(IMD);

my $produrar = $form{'out'};

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