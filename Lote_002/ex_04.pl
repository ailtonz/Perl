#!/usr/bin/perl

# PERL MODULES WE WILL BE USING
use DBI;
use DBD::mysql;

# HTTP HEADER
print "Content-type: text/html \n\n";


print <<EndOfHTML;
<html><head><title>Variaveis de ambiente</title></head>
<body>
EndOfHTML


# CONFIG VARIABLES
$platform = "mysql";
$database = "f4computer";
$host = "localhost";
$port = "3306";
$user = "ailton";
$pw = "41L70N@@";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:localhost:3306";


# PERL DBI CONNECT
#$DBIconnect = DBI->connect($dsn, $user, $pw);

# PERL DBI CONNECT (RENAMED HANDLE)
$dbstore = DBI->connect($dsn, $user, $pw) or die "Unable to connect: $DBI::errstr\n";

# PREPARE THE QUERY
$query = "SELECT * FROM cadastrosgeral";
$query_handle = $connect->prepare($query);

# EXECUTE THE QUERY
$query_handle->execute();

# BIND TABLE COLUMNS TO VARIABLES
$query_handle->bind_columns($idCadastro, \$Nome, \$Telefones);

# EXECUTE THE QUERY
$query_handle->execute();

# LOOP THROUGH RESULTS
while($query_handle->fetch()) {
   print "$idCadastro, $Nome, $Telefones <br />";
} 




print "ok\n";

print "</body></html>";
