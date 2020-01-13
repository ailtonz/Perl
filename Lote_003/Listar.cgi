#!/usr/bin/perl
#read(STDIN, $Dados, $ENV{'CONTENT_LENGTH'});

print "Content-type: text/html\n\n";
print "<html><head><title>Listagem de arquivos</title></head>\n";
print "<body><h1>Listagem de Arquivos\n";

my $diretorio = "/httpdocs/bkp/F4Computer/Comprovantes/Impostos";

opendir(DIR, "$diretorio");
my @lista = readdir(DIR);
closedir(DIR);

foreach my $arquivo(@lista)
{
	unless ( ($arquivo eq ".") || ($arquivo eq "..") ) 
	{ 
	print ARQ1 "<table><td><a href=".$diretorio."/".$arquivo.">".$arquivo."</a></td></table>";	
	} 
}

close(ARQ1);
