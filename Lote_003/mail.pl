use MIME::Lite;

$msg = MIME::Lite->new(
	From     =>'me@myhost.com',
	To       =>'ailtonzsilva@yahoo.com.br',
	Cc       =>'teste@teste.com, teste@teste.com',
	Subject  =>'Helloooooo, nurse!',
	Data     =>"How's it goin', eh?"
);

$msg->send('smtp', 'smtp.mail.yahoo.com.br', Timeout => 60);
