use strict;
use warnings;

open(CORES,">>Cores.txt");
my @cores = ("azul","verde","amarelo","vermelho");

foreach my $i (@cores)
{
	print CORES $i,"\n";
}
close(CORES);