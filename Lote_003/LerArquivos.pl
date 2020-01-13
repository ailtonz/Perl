#!c:/Perl/perl.exe -w
use strict;

open(my $file, q{<}, 'conta-envio.cfg') or die "Can't open file $!\n";
foreach my $arquivo ( <$file> ) {
   #Remove o último caractere apenas se for igual a $/ "Separador de regsitro" 
   chomp($arquivo);
   # Verifica se o arquivo existe  
   print $arquivo."\n";
}