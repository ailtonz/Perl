#!c:/Perl/perl.exe -w

use MIME::Lite;
use MIME::Base64;
use Authen::SASL;
use Sys::Hostname;
    

my $host 	= hostname;
my $smtp	= 'smtp.ailtonzacarias.com.br';
my $to		= 'contato@ailtonzacarias.com.br';
my $pass	= 'wawiwl';
my $cc		= 'ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br,ailton@f4computer.com';
my $subject = '[001-10] - AILTON ZACARIAS (ALTERAÇÃO)';
#my $subject = '['.$host.'] - BKP (OK)';



MIME::Lite->send('smtp',$smtp, AuthUser=>$to, AuthPass=>$pass);

$msg = MIME::Lite->new(
        From     =>$to,
        To       =>$to,
        Cc       =>$cc,
        Subject  =>$subject,
        Data     =>"NÃO RESPONDER ESTE E-MAIL"
    );
	
$msg->send();