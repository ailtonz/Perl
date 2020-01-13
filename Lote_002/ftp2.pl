use Net::FTP;

$ftp = Net::FTP->new("ftp.ailtonzacarias.com.br", Debug => 0)
or die "Cannot connect to some.host.name: $@";

$ftp->login("ailtonftp",'wawiwl')
	or die "Cannot login ", $ftp->message;

$ftp->cwd("/httpdocs/tmp")
	or die "Cannot change working directory ", $ftp->message;

@files = glob("/httpdocs/tmp/*.*");
foreach $file(@files){print $file,"\n";}

#$ftp->get("global.asax") 
#	or die "get failed ", $ftp->message;

$ftp->quit;