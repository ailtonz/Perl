
#!c:/Perl/perl.exe -w

use strict;
use warnings;

use Email::Outlook::Message;

my $filename = "ailton.msg"

$msg = new Email::Outlook::Message $filename;
$mime = $msg->to_email_mime;
$mime->as_string;

print $mime;
