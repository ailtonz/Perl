#!c:/Perl/perl.exe -w
# mail-attachment - send files as attachments

###########################
# Exemplo de Arquivos.txt
#
#Retec.mdb
#dbDados.mdb
#sites.log
###########################

use strict;
use warnings;
use MIME::Lite;
use Getopt::Std;
 
my $SMTP_SERVER = 'smtp.ailtonzacarias.com.br';             # CHANGE ME
my $DEFAULT_SENDER = 'contato@ailtonzacarias.com.br';       # CHANGE ME
my $DEFAULT_RECIPIENT = 'contato@ailtonzacarias.com.br';    # CHANGE ME  
my $CLIENTE = 'RETEC';
my $ARQUIVOS = 'arquivos.txt';
 
MIME::Lite->send('smtp', $SMTP_SERVER, Timeout=>60);

# Criar layout de data
my($dd,$mm,$yy,$day,$hh,$nn) = (localtime)[3,4,5,6,2,1];
my $today =  join '', map sprintf("%02d", $_),($yy%100,$mm+1,$dd,);
my $hr = join '', map sprintf("%02d", $_),($hh,$nn);
my $data = $today.'_'.$hr;
my $ARQ = $data.".zip";

@ARGV = $ARQ; 

# Create a Zip file
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
my $zip = Archive::Zip->new();

open(my $file, q{<}, $ARQUIVOS) or die "Can't open file $!\n";

foreach my $arquivo ( <$file> ) {
   
   #Remove o último caractere apenas se for igual a $/ "Separador de regsitro" 
   chomp($arquivo);
   
   # Verifica se o arquivo existe  
   if (-e $arquivo) 
   {
      # Add a file from disk
      my $file_member = $zip->addFile( $arquivo  );
   }
}

# Save the Zip file
unless ( $zip->writeToFileNamed($ARQ) == AZ_OK ) {
   die 'write error';
}

my (%o, $msg);
  
$o{f} ||= $DEFAULT_SENDER;
$o{t} ||= $DEFAULT_RECIPIENT;
$o{s} ||= $CLIENTE;

# construct and send email
$msg = new MIME::Lite(
    From => $o{f},
    To   => $o{t},
    Subject => $o{s},
    Data => "Hi",
    Type => "multipart/mixed",
);
 
while (@ARGV) {
  $msg->attach('Type' => 'application/octet-stream',
               'Encoding' => 'base64',
               'Path' => shift @ARGV);
}

$msg->send();