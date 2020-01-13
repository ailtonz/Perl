#!/usr/bin/perl -w
# mail-attachment - send files as attachments
 
use MIME::Lite;
use Getopt::Std;
 
my $SMTP_SERVER = 'smtp.ailtonzacarias.com.br';           # CHANGE ME
my $DEFAULT_SENDER = 'contato@ailtonzacarias.com.br';      # CHANGE ME
my $DEFAULT_RECIPIENT = 'contato@ailtonzacarias.com.br';# CHANGE ME  
 
MIME::Lite->send('smtp', $SMTP_SERVER, Timeout=>60);
 
my (%o, $msg);
 
# process options
 
getopts('hf:t:s:', \%o);
 
$o{f} ||= $DEFAULT_SENDER;
$o{t} ||= $DEFAULT_RECIPIENT;
$o{s} ||= 'Your binary file, sir';
 
if ($o{h} or !@ARGV) {
    die "usage:\n\t$0 [-h] [-f from] [-t to] [-s subject] file ...\n";
}
 
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
 
$msg->send(  );
