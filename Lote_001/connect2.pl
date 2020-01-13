use DBI;

#open connection to Access database
$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb);dbq=C:\\RPT-LIMS_2003.mdb');

#prepare and execute SQL statement
$sqlstatement="SELECT * FROM admCategorias";
$sth = $dbh->prepare($sqlstatement);
$sth->execute || 
      die "Could not execute SQL statement ... maybe invalid?";

#output database results
while (@row=$sth->fetchrow_array()){ 
   print "@row\n";
}