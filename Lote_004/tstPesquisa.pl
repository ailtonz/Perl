#!c:/Perl/perl.exe -w

use strict;
use warnings;

my $Lista = 'Arquivos.txt';
my $Pesquisa = 'Pesquisa.txt';

BKP($Lista,$Pesquisa);

sub BKP{
	use File::Copy;
	open(my $file, q{<}, $_[0]);
	#Lê Lista de Arquivos
	foreach my $arquivo ( <$file> ) {
	   #Remove o último caractere apenas se for igual a $/ "Separador de registro" 
	   chomp($arquivo);
	   # Verifica se o arquivo existe
	   if (-e $arquivo){
	   #Abre o arquivo
	   open (my $arquivo, "<$texto") or die "Não foi possível abrir o $texto:$!";
			#Lê o arquivo aberto
			while (<$arquivo>) {
				#Abre lista de pesquisa
			   open(my $lstPesquisa, q{<}, $_[1]);
				#Lê Lista de Pesquisas
				foreach my $lstPesquisa ( <$Pesquisa> ) {
					if ($_ =~ /teste/) { print "ok\n $_ \n"; }
					#mkdir $caminho3;
					#copy($arquivo,$caminho3."/".$arquivo) or die "Copy failed: $!";
				}
			}
		close $arquivo;
	   }
	}
	}