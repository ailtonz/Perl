#!c:/Perl/perl.exe -w

use warnings;

my $Assunto = 'RETEC';
my $smtp	= 'smtp.ailtonzacarias.com.br';
my $to		= 'contato@ailtonzacarias.com.br,ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br,ailton@f4computer.com';
my $senha	= 'wawiwl';

EnviarDados($smtp,$to,$Assunto);

sub EnviarDados{

	use MIME::Lite;
	use MIME::Base64;
	use Authen::SASL;
		

	# Configuração do E-mail.
	my $SMTP_SERVER = $_[0];
	my $DEFAULT_SENDER = $_[1];
		
	MIME::Lite->send('smtp',$SMTP_SERVER, AuthUser=>$to, AuthPass=>$senha);
	
	my (%o, $msg);
	  
	$o{f} ||= $DEFAULT_SENDER;
	#$o{t} ||= $DEFAULT_RECIPIENT;
	$o{s} ||= $_[2];
		
	# construct and send email
	$msg = new MIME::Lite(
	    From => $o{f},
	    #To   => $o{t},
		Subject => $o{s},
	    Data => "Hi",
	    Type => "multipart/mixed",
	);


	# Enviar e-mail
	$msg->send();
	}