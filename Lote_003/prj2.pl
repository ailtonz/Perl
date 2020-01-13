# Program : 2
#!/usr/bin/perl

use strict;

my $match = 'Mark';

my @array = qq[Anthony Mark Alex A];
if ( grep( /$match$/,@array ) ) {
   print "Matched\n";
}
