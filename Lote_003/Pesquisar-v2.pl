#!c:/Perl/perl.exe -w
use strict;
use warnings;

my $Conteudo = 'Conteudos.txt';
#my $Caminho = 'Caminhos.txt';

Procurar($Conteudo);

sub Procurar{
# ARQV, DESTINO
	
open(my $file, q{<}, $_[0]);
foreach my $arquivo ( <$file> ) {
   chomp($arquivo); #Remove o último caractere apenas se for igual a $/ "Separador de regsitro" 
   if (-e $arquivo){#Verifica se o arquivo existe
	my @grepNames = grep(/^$procurar/, @lista); 
	
	
   }
   }

}

sub ConteudoDoArquivoLista{
	open(ARQ1,">Lista.html");
	print ARQ1 "<table><td><a href=".$diretorio."/".$Nome.">".$Nome."</a></td></table>";	
	close(ARQ1);
}

sub InicioDoArquivoLista{
	open(ARQ1,">Lista.html");
	print ARQ1 "<html><head><title>Listagem de arquivos</title></head>\n";
	print ARQ1 "<body><h1>Listagem de Arquivos\n";
	close(ARQ1);
}

sub TerminioDoArquivoLista{
	open(ARQ1,">>Lista.html");
	print ARQ1 "</body></html>\n";
	close(ARQ1);
}