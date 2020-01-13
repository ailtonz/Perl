#!/usr/bin/perl 
use strict;

#[Fri Nov 04 15:31:42 2005]Local/CRMen_H/CRMen_H/agpati/Error(1013104)
#[2005] is an invalid member name in database [CRMen_H]
#
my $codM;
my $diaS;
my $mes;
my $diaM; 
my $hora;
my $ano;
my $nomeServ;
my $nomeApl;
my $nomeBd;
my @portas_dia;
$portas_dia[0]=1;
my @portas_hora;
my @users =();
my @aplic;
my @aplic_dia;


open (LOTE01, "ESSBASE.LOG") or die "No posso abrir arquivo: $!\n";
open (CSV, ">porta.csv") or die "No posso abrir arquivo: $!\n";
while (<LOTE01>)
{
        my $buffer .= $_ ;
	chomp $buffer;
	if ($buffer =~m{ \[ (\w{3}) \s* (\w{3}) \s* (\d{2}) \s* #[Sun Sep 16 
  		(\d{2}:\d{2}:\d{2})\s* #01:21:26 
  		(\d{4}) \] #2007]
  		(\w*) \/ (\w*) \/ (\w*) \/ (\w*) \/ (\w*) (\(\d*\)) #Local/ESSBASE0///Info(1051283)
		(\w*) # regexp pra pegar a segunda linha
		}xm
	){	
	 $diaS=$1; # dia da semana
	 $mes=$2;
	 $diaM=$3; # dia do mes
	 $hora=$4;
	 $ano=$5;
	 $nomeServ=$6;
	 $nomeApl=$7;
	 $nomeBd=$8;
	if($nomeBd eq ""){
		$nomeBd="null";
	}
	my $login=$9;
	if($login eq ""){
		$login="null";
	}
	my $info=$10;
	$codM="$11";
		
	#print "\n$buffer\n";
	#print "$diaS dia da semana\n";
	#print "$mes mes\n";
	#print "$diaM dia do mes \n";
	#print "$hora hora \n";
	#print "$ano ano\n";
	#print "$nomeServ nome servidor\n";
	#print "$nomeApl nome apl\n";
	#print "$nomeBd nomeBD\n";
	#print "$login nome login\n";
	#print "$info nome info \n";
	#print "$codM cod msg\n"; #cod msg	
	
}
elsif($buffer =~ m{ (.*) }xm) {
	if($codM eq "(1051283)"){
		chomp $_;
		#[11] ports in use, [101] ports allowed
		$buffer=~s/\,//g;
		if($buffer=~ m{ \[ (\w*) \]  \s* #[11] 
			(\w*) \s* (\w*) \s* (\w*) #ports in use
			 \s* \[ (\d*) \] \s* # [101] 
			\s* (\s*) #ports allowed
			}xm  ){
			my $portU=$1;
			my $portA=$5;
			select CSV;
			print "$diaM/$mes/$ano;$hora;$portU;$portA\n";
			
			#print "portas livres: $portA\n";
			#my $hint=int($hora);
			#if ( $portas_dia[$diaM] < $portU ){
			#	$portas_dia[$diaM]=$portU;
			#}
			#if ( $portas_hora[$hint] < $portU){
			#	$portas_hora[$hint]=$portU;
		  #}
		}
	}
}
}