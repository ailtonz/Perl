#!c:/Perl/perl.exe -w

use strict;
use warnings;
use MIME::Lite;

my $user = 'ailtonzsilva@gmail.com';
my $pass = '41L70N$$';

my $msg = MIME::Lite->new(
		From =>'Ailton',
		To =>'ailtonzsilva@gmail.com',
		CC =>'contato@ailtonzacarias.com.br',
		Subject =>'yah it worked',
		Type =>'Hello world'
);

MIME::Lite->send('smtp','smtp.gmail.com:465',Debug=>1,AuthUser=>$user, AuthPass=>$pass);
