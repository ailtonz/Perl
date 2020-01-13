#!/usr/bin/perl
use DBI;
use DBD::mysql;
# HTTP HEADER
print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES

$platform = "mysql";
$database = "f4computer";
$host = "localhost";
$port = "3306";
$user = "ailton";
$pw = "41L70N@@";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:$port";

# PERL MYSQL CONNECT()
$connect = DBI->connect($dsn, $user, $pw) || die '$DBI::errstr'; 

# LISTTABLES()
@tables = $db->listtables;

# PRINT EACH TABLE NAME
@tables = $connect->listtables;
foreach $table (@tables) {
	print "$table<br />";
}
