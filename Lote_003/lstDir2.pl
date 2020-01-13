#!/usr/bin/perl

print "Content-type: text/html\n\n"; # Digo ao script o conteúdo do documento

# abro o diretório
opendir (MEUDIR, "c:\_Profissional"); 
@pegoodir = readdir(MEUDIR); 
closedir (MEUDIR);
# já peguei todos os  dados e armazenei no vetor, fecho o diretório
 
foreach (@pegoodir) {
$dados = $_; # como só existe uma coluna no vetor, utilizei o $_ para pegar esta coluna.

if ($dados eq ".") { next; } #prossigo se o nome do arquivo for só . (ver explicação abaixo)
if ($dados eq "..") { next; } #prossigo se o nome do arquivo for só ..
 
open (MEUFILE, "c:\_Profissional");
@minhas_linhas = <MEUFILE>;
close (MEUFILE);

print "<b>Arquivo $dados</b>: @minhas_linhas 

"; # imprimo os arquivos do diretório.

} # fecho o foreach
  