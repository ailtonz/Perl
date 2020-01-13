# CONFIG VARIABLES
$platform = "mysql";
$database = "f4computer";
$host = "localhost";
$port = "3306";
$user = "ailton";
$pw = "41L70N@@";

#DATA SOURCE NAME
$dsn = "dbi:mysql:$database:localhost:3306";

$dbh = DBI->connect($dsn, $user, $password,{ RaiseError => 1, AutoCommit => 0 });