#!/usr/bin/perl -w
# Carlos Carvalho <carlos_lnx@ibest.com.br>
# localiza.pl 


use strict ;
use Env;
open STDERR, ">/dev/null" ;
print "Entre com a palavra chave:\n";
my $chave = <STDIN>; chomp($chave);
print "Entre com o diretorio a partir do qual voce ira buscar:\n";
my $dir = <STDIN>; chomp($dir);
print ("Aguarde...\n");
fork and exit;
my @var = `find $dir`;
my $DOC = "c:/tmp/localiza.out";
open(FILE, ">>$DOC");
foreach my $outside (@var) {
	open(TEMP, "<$outside") ;
	while (<TEMP>) {
		  if ($_=~/$chave/) {
			print(FILE $outside);
		  }
	}
}
close(FILE);
close(TEMP);
print "Busca finalizada. Veja em: c:/tmp/localiza.out\n" ;
