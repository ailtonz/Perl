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
$tablename = "OrdemDeServico";
$user = "ailton";
$pw = "41L70N@@";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:$port";

# PERL DBI CONNECT
$dbh = DBI->connect($dsn, $user, $pw) || die '$DBI::errstr'; 


# DEFINE A MySQL QUERY
$myquery = "INSERT INTO movimentosfinanceiros (DataDeEmissao, Conta, idTipoDespesa, Categorias, Definicao, ValorDocumento, DataDeVencimento, Controle, Faturamento, Observacoes) VALUES ('2010-02-19 00:00:00', 'Ailton', '1', 'Emprestimo', 'Itaú', 2241.94, '2009-11-09 00:00:00', '01/12', NULL, 'ok')";

# EXECUTE THE QUERY FUNCTION
$execute = $connect->query($myquery);

# AFFECTED ROWS
$affectedrows = $execute->affectedrows($myquery);

# PREPARE THE QUERY
$query = "SELECT * FROM movimentosfinanceiros";
$query_handle = $connect->prepare($query);

# EXECUTE THE QUERY
$query_handle->execute();

# BIND TABLE COLUMNS TO VARIABLES
$query_handle->bind_columns(undef, \$DataDeEmissao, \$Conta, \$ValorDocumento);

# LOOP THROUGH RESULTS
while($query_handle->fetch()) {
   print "$DataDeEmissao, $Conta, $ValorDocumento <br />";
} 