#!c:/Strawberry/Perl/perl.exe -w
#use 5.18.0;
use warnings;
use strict;
use DBI;

#definition of variables
my $db="ailton_joomla_f";
my $host="127.0.0.1";
my $user="root";
my $password="41L70N@@";  # the root password

my @data;
my $col;

#connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
                           $user,
                           $password) 
                           or die "Can't connect to database: $DBI::errstr\n";



$dbh->do("call spComputador(0,'cliente','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello','hello')");

#$sth->execute();

						   
#disconnect  from database
$dbh->disconnect  or warn "Disconnection error: $DBI::errstr\n";

exit;



