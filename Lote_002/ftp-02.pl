use Net::FTP;

$ftp = Net::FTP->new("ftp.ailtonzacarias.com.br", Debug => 0)
or die "Cannot connect to some.host.name: $@";

$ftp->login("ailtonftp",'wawiwl')
or die "Cannot login ", $ftp->message;

$ftp->cwd("/httpdocs")
or die "Cannot change working directory ", $ftp->message;

$diretorio = "/httpdocs";

opendir(diretorio, "$diretorio");
@lista = readdir(diretorio);
closedir(diretorio);

foreach $arquivo(@lista)
{
  #if ($arquivo eq "senhas.pwd"){print "senhas:->"}
  #if ($arquivo eq "me_pule.jfs") {next}
  print qq~$arquivo~. "\n";
}

#$ftp->get("global.asax") or die "get failed ", $ftp->message;

$ftp->quit;