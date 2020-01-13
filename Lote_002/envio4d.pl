#!c:/Perl/perl.exe -w
use strict;

use Mail::Sender;

if (my $sender->MailMsg({
   smtp => 'smtp.gmail.com',
   from => 'ailtonzsilva@gmail.com',
   to =>'ailtonzsilva@gmail.com,ailtonzsilva@yahoo.com.br',
   subject => 'this is a test',
   msg => "Hi Johnie.\nHow are you?"
   auth => 'SSL',
   authid => 'ailtonzsilva@gmail.com',
   authpwd => '41L70N$$',
 }) < 0) {
  die "$Mail::Sender::Error\n";
 }
 print "Mail sent OK."