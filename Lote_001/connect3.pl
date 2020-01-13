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


my $SEL = "SELECT * FROM ordensdeservicos";
my $sth = $dbh->prepare($SEL);
$sth->execute();
 
while ( my @row = $sth->fetchrow_array() ) {
    foreach (@row) {
        $_ = "\t" if !defined($_);
        print "$_\t";
    }
    print "\n";
}


print "Conexão OK!";


