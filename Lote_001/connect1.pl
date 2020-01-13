#!/usr/bin/perl 
print "Content-type: text/html \n\n"; 

$dbh = DBI->connect('dbi:mysql:$database:localhost:3306', 'ailton', '41L70N@@') || die '$DBI::errstr'; 

print "Conexão OK!";