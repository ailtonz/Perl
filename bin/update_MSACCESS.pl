use DBI;

my $ATUALIZACAO = 'Atualizacao.sql';
$CAMINHO ='C:\\RETEC\\'; 
$BANCO = 'dbDados.mdb';

#open connection to Access database
$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb);dbq='.$CAMINHO.$BANCO);

# Verifica se o arquivo existe
if (-e $BANCO){
	if (-e $ATUALIZACAO){
		open(my $file, q{<}, $ATUALIZACAO) or die "Can't open file $ARQUIVOS: $!\n";
		foreach my $Comando ( <$file> ){
			#prepare and execute SQL statement
			$sqlstatement=$Comando;
			$sth = $dbh->prepare($sqlstatement);
			$sth->execute || die "Could not execute SQL statement ... maybe invalid?";
		}
		unlink ($ATUALIZACAO);
	}
}
