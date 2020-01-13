use Net::FTP;

$ftp = Net::FTP->new("ftp.ailtonzacarias.com.br", Debug => 0)
or die "Cannot connect to some.host.name: $@";

$ftp->login("ailtonftp",'wawiwl')
or die "Cannot login ", $ftp->message;

$ftp->cwd("/httpdocs")
or die "Cannot change working directory ", $ftp->message;

$ftp->get("global.asax")
or die "get failed ", $ftp->message;

$ftp->quit;