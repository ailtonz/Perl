use Convert::TNEF;

$filename = 'C:/Users/Ailton/Desktop/tmp/ENVIADOS/Codigo Internacional de doença 2009 FSL - 023-09.msg';

$tnef = Convert::TNEF->read_in($filename) or die Convert::TNEF::errstr;


$tnef->purge;

$message = $tnef->message;

print $message;
