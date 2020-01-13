#!/usr/bin/perl

use warnings;
use strict;
use DBI;

# HTTP HEADER
print "Content-type: text/html \n\n";

# CONFIG VARIABLES
$platform = "mysql";
$database = "f4computer";
$hostname = "localhost";
$port = "3306";
$tablename = "movimentosfinanceiros";
$user = "ailton";
$pw = "41L70N@@";

$dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";

$dbh = DBI->connect($dsn, $user, $password);

@databases = DBI->data_sources("mysql",
      {"host" => $host, "port" => $port, "user" => $user, password => $pass});
	  
$sth = $dbh->prepare("LISTFIELDS $table");

$sth->execute;

print "Dado adicionado com sucesso!\n";