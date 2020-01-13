#!/usr/bin/perl

# PERL MODULES WE WILL BE USING
use DBI;
use DBD::mysql;

# HTTP HEADER
print "Content-type: text/html \n\n";

# CONFIG VARIABLES
$platform = "mysql";
$database = "f4computer";
$host = "localhost";
$port = "3306";
$tablename = "movimentosfinanceiros";
$user = "ailton";
$pw = "41L70N@@";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:$port";

# PERL DBI CONNECT
$dbh = DBI->connect($dsn, $user, $pw) || die '$DBI::errstr'; 

# SELECT DB
$connect->selectdb($database);

# DEFINE A MySQL QUERY
$myquery = "INSERT INTO $tablename (DataDeEmissao, Conta, idTipoDespesa, Categorias, Definicao, ValorDocumento, DataDeVencimento, Controle, Faturamento, Observacoes) VALUES ('2010-02-19', 'Ailton', '1', 'Emprestimo', 'Itaú', 2241.94, '2009-11-09', '01/12', NULL, 'ok')";

# EXECUTE THE QUERY FUNCTION
$execute = $connect->prepare($myquery);

$execute->execute() || print "n,ok!";