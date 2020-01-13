#!c:/Perl/perl.exe -w

use strict;
use warnings;


my $Lista = 'Arquivos.txt';

open(my $file, q{<}, $Lista);
foreach my $arquivo ( <$file> ) {
   #Remove o último caractere apenas se for igual a $/ "Separador de registro" 
   chomp($arquivo);
   # Verifica se o arquivo existe
   if (-e $arquivo){
	#print $arquivo;
	
	unlink($arquivo) or die("Não consegui!");


	}
}