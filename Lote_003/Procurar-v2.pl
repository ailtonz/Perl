# abro o diretório
opendir (MEUDIR, "C:/Tmp/e-Mails/Mes 06"); 
@pegoodir = readdir(MEUDIR); 
closedir (MEUDIR);
# já peguei todos os dados e armazenei no vetor, fecho o diretório
 
foreach (@pegoodir) {
$dados = $_; # como só existe uma coluna no vetor, utilizei o $_ para pegar esta coluna.

if ($dados eq ".") { next; } #prossigo se o nome do arquivo for só . 
if ($dados eq "..") { next; } #prossigo se o nome do arquivo for só ..
 
open (MEUFILE, "/home/LOGIN/www/meudir/$dados");
@minhas_linhas = <MEUFILE>;
close (MEUFILE);

print @minhas_linhas; # imprimo os arquivos do diretório.

} # fecho o foreach