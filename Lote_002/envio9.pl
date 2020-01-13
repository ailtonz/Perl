#!c:/Perl/bin/perl.exe -w
use warnings;

use Email::Send;

my $user = 'ailtonzsilva@gmail.com'; 
my $pass = '41L70N$$'; 



my $mailer = Email::Send->new(
    {
        mailer      => 'SMTP::TLS',
        mailer_args => [
            Host     => 'smtp.gmail.com',
            Port     => 587,
            User     => $user,
            Password => $pass,
			From    => $user, 
			To      => 'ailtonzsilva@gmail.com', 
			Data    => 'This is a test\n', 
			Subject => 'Test',			
        ]
    }
);
