If ($ENV{'REQUEST_METHOD'} NE 'POST')
{
print <<"HTML";
	<HTML>
	<HEAD>
	<TITLE>Lamento!</TITLE>
	</HEAD>
	<BODY>
	<H1>Uso de M�todo Errado!</H1>
	Lamento, mas s� utilizamos o m�todo POST aqui.
	</BODY>
	</HTML>
HTML
exit;
}
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs = split(/&/, $buffer);
foreach $pair (@pairs){($name, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$form{$name} = $value;
}
chop($date = 'date');

if ($form{'airbag'})	{print MAIL "- Airbag para o passageiro\n";}
if ($form{'pcaps'})		{print MAIL "- Calotas de plastico\n";}
if ($form{'rdefrost'})	{print MAIL "- Desembacador do vidro traseiro\n";}
if ($form{'stire'})		{print MAIL "- Estepe\n";}

print MAIL <<"EOM";
	Seguem algumas informacoes pessoais de $form{'fname'}:
	$form{'fname'} $form{'lname'}
	$form{'email'}
	$form{'street'}
	$form{'city'}, $form{'state'} $form{'zip'}
	Fone res.: $form{'hphone'}
	Fone com.: $form{'wphone'}
	$form{'fname'} pediu para que nos:
EOM

if ($form{'billing'} eq "bill"){print MAIL "Mandaremos a fatura.\n";}

if ($form{'billing'} eq "ccard"){
	print MAIL "Cobraremos pelo cartao de credito";
	print MAIL "em nome de $form{'cname'}.\n";
	print MAIL "CC\#$form{'cnum'} e validade $form{'cexpire'}.\n\n";}

print <<"HTML";
	<HTML>
	<HEAD>
	<TITLE>Agradecimento</TITLE>
	</HEAD>
	<BODY>
	<H1> Obrigado pela requisi��o! </H1>
	Obrigado pela requisi��o <B>$form{'fname'}</B>! Esta mensagem foi enviada para o departamento
	apropriado e n�s iremos entregar o seu novo $form{'color'} $form{'year'} $form{'model'} $form{'doors'}-
	porta(s) assim que verificarmos o seu cr�dito com um pente fino.<P>
	Se n�o entrarmos em contato nos pr�ximos 8 meses, envie email para <A
	HREF=\"mailto:$sendto\">$sendto</A>, e pergunte por que seu pedido n�o foi atendido
	rapidamente</B> como esperado. <P>
	Foi muito bom t�-lo como cliente!!<P>
	<I>Atenciosamente,</I><BR>
	Sr. Supkay (ele mesmo).
	</BODY>
	</HTML>
HTML
exit;