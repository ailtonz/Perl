#!c:/Perl/perl.exe -w

### Autor: Carcarah
### email: thenazgul@terra.com.br
### NÃO MODIFIQUEM O NOME DO AUTOR

### Script para listar o conteúdo de uma pasta e mostrá-lo em uma tabela. Gera a saída em html.

use File::Listing;

print "Content-type: text/html\n\n";

print "<body>\n";

&lsdir();

print "</body>\n";

exit;

############################### FUNCOES ##############################

sub lsdir {
  my $szTotal = 0;
  
  print "<table>\n";
  for(parse_dir('dir .')) {
   ($nome, $tipo, $sz, $mtime, $modo) = @$_;
   $szTotal = $szTotal + $sz;
   $sz = $sz / 1024;

   printf("<tr>\t<td>\t<a href=\"$nome\"> $nome </a></td>\r<td> %.2f (Kbytes) </td></tr>\n",$sz) if($nome ne "index.pl");
   next if $tipo ne 'f';
  }

  $szTotal = $szTotal / 1048576;
  print "</table>";
  printf "<br>Total de arquivos : %.2f Mbytes", $szTotal;
}