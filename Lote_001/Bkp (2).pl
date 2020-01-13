#!c:/Perl/perl.exe -w

use strict;
use warnings;

my $Lista = 'Arquivos.txt';
my $Caminho = 'BKP';

BKP($Lista,$Caminho);

sub BKP{
# ARQV, DESTINO
	use File::Copy;
	open(my $file, q{<}, $_[0]);
	foreach my $arquivo ( <$file> ) {
	   #Remove o último caractere apenas se for igual a $/ "Separador de regsitro" 
	   chomp($arquivo);
	   # Verifica se o arquivo existe
	   if (-e $arquivo){
		   mkdir $Caminho;
		   copy($arquivo,$_[1]."\\".DataHora()."_".$arquivo) or die "Copy failed: $!";
	   }
	}
	}

# Criar layout de data
sub DataHora{
	my($dd,$mm,$yy,$day,$hh,$nn) = (localtime)[3,4,5,6,2,1];
	my $today =  join '', map sprintf("%02d", $_),($yy%100,$mm+1,$dd,);
	my $hr = join '', map sprintf("%02d", $_),($hh,$nn);

	# "Vasio" = Data e hora | "1" Apenas Data
	my $data = $_[0] ? $today:$today.'_'.$hr;
		
	my $datahora = $data;
	
	return ($datahora);
	}