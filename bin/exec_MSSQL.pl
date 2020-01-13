use strict; 
use warnings;
use diagnostics;
use Class::DBI::Loader;   
use DBI;
use File::Glob ':glob';

my $DBUserName                     = "SISCOB_HML";
my $DBPassword                     = "@Cc3nture.[0m$3";
my $DBName                         = "dbi:MSSQL:uat-dbserver1";

my $dbh                         = "";
my $sqlStatement                 = "";
my $sqlCmd                         = "";

my @EasySetTableNames            = ();

$dbh = DBI->connect( $DBName, $DBUserName, $DBPassword,
    { PrintError => 0, AutoCommit => 0})
        || die "Database connection creation failed: $DBI::errstr\n";

$sqlStatement = "SELECT * from [SISCOB].[dbo].[TB_USER] ";
$sqlCmd = $dbh->prepare($sqlStatement);
$sqlCmd->execute();
@EasySetTableNames = @{$dbh->selectcol_arrayref($sqlStatement)};
print "hi";