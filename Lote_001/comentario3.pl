#!/usr/bin/perl
#read(STDIN, $Dados, $ENV{'CONTENT_LENGTH'});

print "Content-type: text/html\n\n";
print "<html><head><title>Listagem de arquivos</title></head>\n";
print "<body><h1>Listagem de Arquivos\n";


@files = glob("*.*");
foreach $file(@files){
	print "<table><td><a href=".$file.">".$file."</a></td></table>";
}
print "</body></html>\n";


