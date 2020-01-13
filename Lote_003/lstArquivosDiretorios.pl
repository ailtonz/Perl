my $diretorio = "/tmp"; 

 opendir (DIR, $diretorio) || die "ERRO: Nao abre ($diretorio): $!"; 
 my @files = readdir (DIR); 
 closedir (DIR); 