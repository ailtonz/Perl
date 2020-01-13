If ($ENV{'REQUEST_METHOD'} NE 'POST')
{
print <<"HTML";
	<HTML>
	<HEAD>
	<TITLE>Lamento!</TITLE>
	</HEAD>
	<BODY>
	<H1>Uso de Método Errado!</H1>
	Lamento, mas só utilizamos o método POST aqui.
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
	<H1> Obrigado pela requisição! </H1>
	Obrigado pela requisição <B>$form{'fname'}</B>! Esta mensagem foi enviada para o departamento
	apropriado e nós iremos entregar o seu novo $form{'color'} $form{'year'} $form{'model'} $form{'doors'}-
	porta(s) assim que verificarmos o seu crédito com um pente fino.<P>
	Se não entrarmos em contato nos próximos 8 meses, envie email para <A
	HREF=\"mailto:$sendto\">$sendto</A>, e pergunte por que seu pedido não foi atendido
	rapidamente</B> como esperado. <P>
	Foi muito bom tê-lo como cliente!!<P>
	<I>Atenciosamente,</I><BR>
	Sr. Supkay (ele mesmo).
	</BODY>
	</HTML>
HTML
exit;