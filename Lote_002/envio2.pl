$sender = new Mail::Sender {
		smtp => 'mail.f4computer.com',
		from => 'ailton@f4computer.com',
		on_errors => undef
}
		or die "Can't create the Mail::Sender object: $Mail::Sender::Error\n";
$sender->Open({
		to => 'ailton@f4computer.com',
		cc => 'ailtonzsilva@gmail.com',
		subject => 'Sorry, I\'ll come later.'
})
		or die "Can't open the message: $sender->{'error_msg'}\n";
$sender->SendLineEnc("I'm sorry, but thanks to the lusers,
		I'll come at 10pm at best.");
$sender->SendLineEnc("\nHi, Jenda");
$sender->Close() or die "Failed to send the message: $sender->{'error_msg'}\n";



