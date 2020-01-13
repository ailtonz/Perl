#!c:/Perl/perl.exe -w
use strict;
use MIME::Lite;
use MIME::Base64;
use Authen::SASL;
    

my $smtp	= 'smtp.ailtonzacarias.com.br';						#CONTA-ENVIO.SMTP
my $to		= 'contato@ailtonzacarias.com.br';					#CONTA-ENVIO.EMAIL
my $pass	= 'wawiwl';											#CONTA-ENVIO.PASSWORD

my $subject = '[007-10] - AILTON ZACARIAS (ATUALIZADO!)'; 		#SAIDA.ASSUNTO[0]
my $cc		= 'ailtonzsilva@gmail.com,ailton@f4computer.com'; 	#SAIDA.CONTATOS[1]

MIME::Lite->send('smtp',$smtp, AuthUser=>$to, AuthPass=>$pass);

my $msg = MIME::Lite->new(
        From     =>$to,
        To       =>$to,
        Cc       =>$cc,
        Subject  =>$subject,
		Type     =>'TEXT',
        Data     =>"c:\\tmp\\ailton.xls" 						#SAIDA.CAMINHO_ARQUIVO[2]
    );
	
$msg->send();