#!/usr/bin/perl

use warnings;
use strict;
use DBI();

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

#[ Inserindo os dados ]
$query = "INSERT INTO movimentosfinanceiros (Faturamento) VALUES ('teste')";
$insert = $dbh->prepare_cached($query);
$insert->execute() or die 'Impossivel conectar no Servidor: $DBI::errstr';
print “Dado adicionado com sucesso!\n”;



