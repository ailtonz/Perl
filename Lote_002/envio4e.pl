#!c:/Perl/perl.exe -w
use strict;
use warnings;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;

my $email = Email::Simple->create(
  header => [
	  From    => 'ailtonzsilva@gmail.com',
	  To      => 'ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br,ailton@f4computer.com',
	  Subject => 'Server down',
  ],
  body => 'The server is down. Start panicing.',
);

my $sender = Email::Send->new(
  {   mailer      => 'Gmail',
	  mailer_args => [
		  username => 'ailtonzsilva@gmail.com',
		  password => '41L70N$$',
	  ]
  }
);
eval { $sender->send($email) };
die "Error sending email: $@" if $@;