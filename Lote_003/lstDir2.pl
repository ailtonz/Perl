#!/usr/bin/perl

print "Content-type: text/html\n\n"; # Digo ao script o conte�do do documento

# abro o diret�rio
opendir (MEUDIR, "c:\_Profissional"); 
@pegoodir = readdir(MEUDIR); 
closedir (MEUDIR);
# j� peguei todos os  dados e armazenei no vetor, fecho o diret�rio
 
foreach (@pegoodir) {
$dados = $_; # como s� existe uma coluna no vetor, utilizei o $_ para pegar esta coluna.

if ($dados eq ".") { next; } #prossigo se o nome do arquivo for s� . (ver explica��o abaixo)
if ($dados eq "..") { next; } #prossigo se o nome do arquivo for s� ..
 
open (MEUFILE, "c:\_Profissional");
@minhas_linhas = <MEUFILE>;
close (MEUFILE);

print "<b>Arquivo $dados</b>: @minhas_linhas 

"; # imprimo os arquivos do diret�rio.

} # fecho o foreach
  