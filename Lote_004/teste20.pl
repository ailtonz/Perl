use strict;
use warnings;

my @filmes = ("Central do Brasil", "G�meas", "Bossa Nova", "Villa-Lobos");
my $i = 1;
foreach my $nome(@filmes)
{
print "$i - $nome\n";
$i++;
}