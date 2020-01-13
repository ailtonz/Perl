opendir(DIR,".") || print "Falha de Leitura";

@dir = readdir(DIR);

foreach my $ok(@dir) {print $ok."\n";}