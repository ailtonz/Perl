#!c:/Perl/bin/perl.exe -w

use warnings;

use MIME::Lite 
$user = 'ailtonzsilva@gmail.com'; 
$pass = '41L70N$$'; 

MIME::Lite->send('smtp','smtp.gmail.com', AuthUser=>$user, AuthPass=>$pass); 


my $msg = MIME::Lite->new 
( 
From    => 'ailtonzsilva@gmail.com', 
To      => 'ailtonzsilva@gmail.com', 
Data    => 'This is a test\n', 
Subject => 'Test', 
); 