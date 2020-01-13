#!/usr/bin/env perl
#
# Renomeando arquivos de forma padronizada (Versao Perl).
#
# Sandro Marcell (sandro_marcell@yahoo.com.br)
# Boa Vista, Roraima - 03/09/2008 (Atualizado em 12/10/2008). 
#
# 12/10/2008
# - Adicionado suporte a opcoes longas;
# - Adicionada opcao de modo silencioso.
#
# Uso: Faca "./script.pl --ajuda" para mais detalhes.
#
# Obs.:
# - Se declaradas, as opcoes [-n]*, [-c]* e [-e]*, devem obrigatoriamente
# possuir valores *(o mesmo e valido para opcoes longas);
# - Se a opcao [-c] nao for declarada, o contador iniciara em 1;
# - Os arquivos renomeados serao movidos para o diretorio de trabalho
# corrente;
# - Ao declarar a opcao [-b], um subdiretorio sera criado em /tmp
# e os arquivos serao copiados para ele, antes de serem renomeados;
# - E possivel o uso de metacaracteres.

# Modulos utilizados:
use Getopt::Long;
use File::Copy;

$prog = $0;
$prog =~ s/.*\///g;

# Como utilizar o script:
sub __uso__ {
   print <<FIM;
Uso: $prog -abs [-c NUMERO] [-e EXTENSAO] [-n NOME] arquivo1 ... arquivoN
Onde:
-a,        --ajuda             : Mostra esta tela de ajuda.
-b,        --backup             : Cria backups dos arquivos
-c NUMERO,   --contador=NUMERO    : Contador numerico
-e EXTENSAO, --extensao=EXTENSAO  : Extensao dos arquivos
-n NOME,     --nome=NOME     : Novo nome dos arquivos   
-s,          --silencioso         : Modo silencioso

Exemplos:

# Renomear somente arquivos jpg:
$prog --nome=imagem --extensao=jpg --contador=1 ~/pessoal/*.[jJ][pP][gG]

# Renomear arquivos com o formato 001.txt ... 010.txt ..:
$prog -e txt ~/docs/*

# Criar backups antes de renomear arquivos:
$prog -b -n texto -c 10 -e txt ~/arqs/*

# Renomear arquivos de diferentes diretorios:
$prog --nome=copia --contador=1 --extensao=bkp ~/pessoal/* ~/docs/* ...

FIM
   exit(1);
}

# Inicializando variaveis:
$bkp    = '';
$cont   = 1 ;
$ext    = '';
$nome   = '';
$output = '';

# Checando parametros:
__uso__ unless (@ARGV);

# Opcoes que podem ser definidas pelo usuario:
%opc = ();
GetOptions(\%opc,
   'a|ajuda',
   'b|backup',
   'c|contador=i',
   'e|extensao=s',
   'n|nome=s',
   's|silencioso',
) || die("Faca '$prog --ajuda' para obter ajuda.\n");

# Caracteres invalidos (non-word) nao serao aceitos como argumentos 
# para as opcoes [-e] e [-n]:
__uso__ if $opc{e} =~ /\W/ || $opc{n} =~ /\W/;

# Obtendo ajuda:
__uso__ if defined $opc{a};

# Se a opcao [-b] for declarada, entao define-se o local onde sera
# criado o diretorio de backup e se ele nao existir, cria-o:
if (defined $opc{b}) { 
   our($bkp , $dbkp);
   $bkp  = "sim";
   $dbkp = "/tmp/$prog-$ENV{USER}";
   mkdir($dbkp) unless -d $dbkp;
}

# Extensao dos arquivos:
$ext = $opc{e} if defined $opc{e};
# Contador numerico:
$cont = $opc{c} if defined $opc{c};
# Novo nome dos arquivos:
$nome = $opc{n} if defined $opc{n};
# Modo silencioso:
$output = "nao" if defined $opc{s};

# O usuario especificou algum arquivo?
die("Erro: Especifique os arquivos a serem renomeados.\n") unless (@ARGV);

# Informando o destino dos arquivos renomeados:
print <<FIM;
ATENCAO: Os arquivos renomeados serao movidos para: $ENV{PWD}
Renomeando...
FIM
sleep(2);

# Loop de execucao:
foreach (@ARGV) {

   # Testes condicionais:
   if (! -e "$_") {
      print("[$_]: Arquivo nao encontrado.\n");
      next;
   } elsif (! -w "$_") {
      print("[$_]: Sem permissao para renomear.\n");
      next;
   } elsif (-d "$_") {
      print("[$_]: Diretorios nao serao renomeados.\n");
      next;
   }
   
   # Criar 'backups' antes de renomear arquivos?
   copy("$_" , $dbkp) if $bkp eq "sim";
   
   # Adicionando zeros ao contador (ex.: 001 ... 099):
   $zeros = sprintf("%03d" , $cont);
   # Concatenando variaveis para formar o novo nome:
   my $nn .= "${nome}${zeros}.$ext";
   
   # Renomeando...
   rename("$_" , $nn);
   print("[$_] Renomeado para: $nn\n") if $! == 0 && $output ne "nao"; 

   # Incrementando contador:
   $cont++;
}
# Fim