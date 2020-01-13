#!c:/Perl/perl.exe -w

use strict;
use warnings;

my $Arquivos = 'Arquivos.txt';
my $Pesquisa = 'Pesquisa.txt';

BKP($Arquivos,$Pesquisa);

sub BKP{
	open(my $file, q{<}, $_[0]);							#Abre o arquivo "Arquivos.txt"
	foreach my $lArquivos ( <$file> ) 
		{						#L� Lista de "Arquivos.txt"
		   chomp($lArquivos);									#Remove o �ltimo caractere apenas se for igual a $/ "Separador de registro" 
		   if (-e $lArquivos)
		   {									#Verifica se o arquivo "Arquivos.txt" existe
		   open(my $iPesquisa, q{<}, $_[1]);					#Abre o arquivo "Pesquisa.txt"
		   foreach my $lPequisa ( <$iPesquisa> ) 
				{				#L� o arquivo aberto "Pesquisa.txt"
					if ($_ =~ /ok/) 
					{ 
					print "ok\n $iPesquisa \n"; 
					}
				}
			close $iPesquisa;
		   }
		}
	close $file;
	}