# Here's a rather long example where mail is retrieved
 # from a POP3 server based on header information, then
 # it is MIME parsed, and then the TNEF contents
 # are extracted and converted.

 use strict;
 use Net::POP3;
 use MIME::Parser;
 use Convert::TNEF;

 my $mail_dir = "mailout";
 my $mail_prefix = "mail";

 my $pop = new Net::POP3 ( "pop.f4computer.com" );
 my $num_msgs = $pop->login("ailton","wawiwl");
 die "Can't login: $!" unless defined $num_msgs;

 # Get mail by sender and subject
 my $mail_out_idx = 0;
 MESSAGE: for ( my $i=1; $i<= $num_msgs;  $i++ ) {
  my $header = join "", @{$pop->top($i)};

  for ($header) {
   next MESSAGE unless
    /^from:.*someone\@somewhere.net/im && /^subject:\s*important stuff/im
  }

  my $fname = $mail_prefix."-".$$.++$mail_out_idx.".doc";
  open (MAILOUT, ">$mail_dir/$fname")
   or die "Can't open $mail_dir/$fname: $!";
  # If the get() complains, you need the new libnet bundle
  $pop->get($i, \*MAILOUT) or die "Can't read mail";
  close MAILOUT or die "Error closing $mail_dir/$fname";
  # If you want to delete the mail on the server
  # $pop->delete($i);
 }

 close MAILOUT;
 $pop->quit();

 # Parse the mail message into separate mime entities
 my $parser=new MIME::Parser;
 $parser->output_dir("mimemail");

 opendir(DIR, $mail_dir) or die "Can't open directory $mail_dir: $!";
 my @files = map { $mail_dir."/".$_ } sort
  grep { -f "$mail_dir/$_" and /$mail_prefix-$$- /o } readdir DIR;
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
   for my $sub_ent ( $ent->parts ) {
    print_tnef_parts($sub_ent);
   }
  } elsif ( $ent->mime_type =~ /ms-tnef /i ) {

   # Create a tnef object
   my $tnef = Convert::TNEF->read_ent($ent,{output_dir=>"tnefmail"})
    or die $Convert::TNEF::errstr;
   for ($tnef->attachments) {
    print "Title:",$_->name,"\n";
    print "Data:\n",$_->data,"\n";
   }

   # If you want to delete the working files
   # $tnef->purge;
  }
 }