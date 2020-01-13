#!c:/Perl/perl.exe -w

use warnings;

use MIME::Lite;

$msg = MIME::Lite->new(
        From     =>'ailton@f4computer.com',
        To       =>'ailtonzsilva@gmail.com',
        Cc       =>'ailtonzsilva@gmail.com, ailtonzsilva@yahoo.com.br',
        Subject  =>'Helloooooo, nurse!',
        Data     =>"NÃO RESPONDER!"
    );
$msg->send('smtp','smtp.f4computer.com', 'ailton@f4computer.com', 'wawiwl');
