
use Net::SMTP::TLS;
my $user = 'ailtonzsilva@gmail.com'; 
my $pass = '41L70N$$'; 

my $smtp = new Net::SMTP::TLS('smtp.gmail.com',
	Port    =>      587,
	User    =>      $user,
	Password=>      $pass);

