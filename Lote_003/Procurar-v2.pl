# abro o diret�rio
opendir (MEUDIR, "C:/Tmp/e-Mails/Mes 06"); 
@pegoodir = readdir(MEUDIR); 
closedir (MEUDIR);
# j� peguei todos os dados e armazenei no vetor, fecho o diret�rio
 
foreach (@pegoodir) {
$dados = $_; # como s� existe uma coluna no vetor, utilizei o $_ para pegar esta coluna.

if ($dados eq ".") { next; } #prossigo se o nome do arquivo for s� . 
if ($dados eq "..") { next; } #prossigo se o nome do arquivo for s� ..
 
open (MEUFILE, "/home/LOGIN/www/meudir/$dados");
@minhas_linhas = <MEUFILE>;
close (MEUFILE);

print @minhas_linhas; # imprimo os arquivos do diret�rio.

} # fecho o foreach