use WWW::Contact;
use Data::Dumper;

my $wc       = WWW::Contact->new();
$wc->known_supplier->{'gmail.com'} = 'Gmail';
my @contacts = $wc->get_contacts('ailtonzsilva@gmail.com', '41L70N$$');
my $errstr   = $wc->errstr;
if ($errstr) {
	die $errstr;
} else {
	print Dumper(\@contacts);
}