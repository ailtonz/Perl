#!c:/Perl/perl.exe -w

use warnings;

my $Assunto = 'EM TESTES!!!';
my $cc		= 'ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br,ailton@f4computer.com';

my $smtp	= 'smtp.ailtonzacarias.com.br';
my $to		= 'contato@ailtonzacarias.com.br';
my $senha	= 'wawiwl';


#my $Pacote = $Assunto.".zip";

#my $Lista = 'Arquivos.txt';
#CompactarArquivos($Lista,$Pacote);

EnviarDados($smtp,$to,$Assunto,$cc);

sub EnviarDados{
# SMTP, E-MAIL, TITULO, ARQUIVO, CC

	use MIME::Lite;
	use MIME::Base64;
	use Authen::SASL;
	
	

	# Configura��o do E-mail.
	my $SMTP_SERVER = $_[0];
	my $DEFAULT_SENDER = $_[1];
	my $DEFAULT_RECIPIENT = $_[3];
		
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
		body => "N�o responda este e-mail",
		Subject => $o{s},
	    Data => "Hi",
	    Type => "multipart/mixed",
	);

#	# Anexar arquivo p/ envio.
#	@ARQV = $_[4];
#	while (@ARQV) {
#	  $msg->attach('Type' => 'application/octet-stream',
#	               'Encoding' => 'base64',
#	               'Path' => shift @ARQV);
#	}

	# Enviar e-mail
	$msg->send();
	}

sub CompactarArquivos{
# ARQVS, NomeDoPacote
	# Create a Zip file
	use Getopt::Std;
	use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
	my $zip = Archive::Zip->new();

	open(my $file, q{<}, $_[0]) or die "Can't open file $!\n";
	foreach my $arquivo ( <$file> ) {
	   #Remove o �ltimo caractere apenas se for igual a $/ "Separador de regsitro" 
	   chomp($arquivo);
	   # Verifica se o arquivo existe  
	   if (-e $arquivo){
	      # Add a file from disk
	      my $file_member = $zip->addFile($arquivo);
	   }
	}

	# Save the Zip file
	unless ( $zip->writeToFileNamed($_[1]) == AZ_OK ) {
	   die 'write error';
	}
	
	}	
	
sub DataHora{
# Criar layout de data
	my($dd,$mm,$yy,$day,$hh,$nn) = (localtime)[3,4,5,6,2,1];
	my $today =  join '', map sprintf("%02d", $_),($yy%100,$mm+1,$dd,);
	my $hr = join '', map sprintf("%02d", $_),($hh,$nn);

	# "Vasio" = Data e hora | "1" Apenas Data
	my $data = $_[0] ? $today:$today.'_'.$hr;
		
	my $datahora = $data;
	
	return ($datahora);
	}
