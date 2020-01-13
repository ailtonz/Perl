use strict;
use warnings;
use MIME::Parser;
use Convert::TNEF;

my $mail_dir = 'C:/Users/Ailton/Desktop/tmp/ENVIADOS';

# Parse the mail message into separate mime entities
my $parser=new MIME::Parser; $parser->output_dir("mimemail");

opendir(DIR, $mail_dir) or die "Can't open directory $mail_dir: $!";
	my @files = $mail_dir;
	#grep { -f "$mail_dir/$_" and /$mail_prefix-$$- /o } readdir DIR;
closedir DIR;

for my $file ( @files ) {
	my $entity=$parser->parse_in($file) or die "Couldn't parse mail";
	print_tnef_parts($entity);
	# If you want to delete the working files
	# $entity->purge;
}

sub print_tnef_parts {
	my $ent = shift;

	if ( $ent->parts ) {
		for my $sub_ent ( $ent->parts ) {print_tnef_parts($sub_ent);}
		} 
	elsif ( $ent->mime_type =~ /ms-tnef /i ) {

	# Create a tnef object
	my $tnef = Convert::TNEF->read_ent($ent,{output_dir=>"tnefmail"}) or die $Convert::TNEF::errstr;

	for ($tnef->attachments) {
		print "Title:",$_->name,"\n";
		print "Data:\n",$_->data,"\n";
		}

	# If you want to delete the working files
	# $tnef->purge;
	}
}