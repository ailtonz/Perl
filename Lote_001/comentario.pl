#!/usr/bin/perl
read(STDIN, $Dados, $ENV{'CONTENT_LENGTH'});
print "Content-type: text/html\n\n";
print "<html><head><title>Resposta CGI</title></head>\n";
print "<body><h1>Resposta CGI do programa comentario.pl\n";
@CamposForm = split(/&/, $Dados);
foreach $Campo (@CamposForm) {
   ($nome, $valor) = split(/=/, $Campo);
   $valor =~ tr/+/ /;
   $valor =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
   $valor =~ s/<!--(.|\n) *-->//g;
   $Form{$nome} = $nome;
   $Form{$valor} = $valor;
   print "$Form{$nome} = $Form{$valor}", "
\n";
}
print "</body></html>\n";