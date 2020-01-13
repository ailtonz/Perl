#!c:/Perl/bin/perl.exe -w

use warnings;

use MIME::Lite;

my $user = 'ailtonzsilva@gmail.com'; 
my $pass = '41L70N$$'; 
my $smtp = 'smtp.gmail.com:465';

MIME::Lite->send('SMTP::TLS',$smtp,Port => '587', AuthUser=>$user, AuthPass=>$pass,Timeout => 60); 


my $msg = MIME::Lite->new 
( 
	From    => 'ailtonzsilva@gmail.com', 
	To      => 'ailtonzsilva@gmail.com', 
	Data    => 'This is a test\n', 
	Subject => 'Test',

); 

