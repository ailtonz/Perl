#!c:/Perl/perl.exe -w

my $Cliente = 'RETEC';
my $smtp	= 'smtp.ailtonzacarias.com.br';
my $to		= 'contato@ailtonzacarias.com.br';
my $senha	= 'wawiwl';
my $cc		= 'ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br,ailton@f4computer.com';
my $Pacote;

EnviarDados($smtp,$to,$Cliente,$Pacote,$cc);

sub EnviarDados{
# SMTP, E-MAIL, TITULO, ARQUIVO, CC

	use MIME::Lite;
	use MIME::Base64;
	use Authen::SASL;
	
	#@ARQV = $_[3];

	# Configuração do E-mail.
	my $SMTP_SERVER = $_[0];
	my $DEFAULT_SENDER = $_[1];
	my $DEFAULT_RECIPIENT = $_[4];
		
	MIME::Lite->send('smtp',$SMTP_SERVER, AuthUser=>$to, AuthPass=>$senha);
	
	my (%o, $msg);
	  
	$o{f} ||= $DEFAULT_SENDER;
	$o{t} ||= $DEFAULT_RECIPIENT;
	$o{s} ||= $_[2];
	$o{c} ||= $_[1];
		
	# construct and send email
	$msg = new MIME::Lite(
	    From => $o{f},
	    To   => $o{t},
		Subject => $o{s},
	    Data => "Hi",
	    Type => "multipart/mixed",
	);

	# Anexar arquivo p/ envio.
	# while (@ARQV) {
	  # $msg->attach('Type' => 'application/octet-stream',
	               # 'Encoding' => 'base64',
	               # 'Path' => shift @ARQV);
	# }

	# Enviar e-mail
	$msg->send();
	}
