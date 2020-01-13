use strict;
use warnings;

my $Conteudo = 'Conteudos.txt';

Procurar($Conteudo);

sub Procurar{

open(my $file, q{<}, $_[0]);

foreach my $i (<$file>)
{
	chomp($i);
	print $i,"\n";
}
close();
}
