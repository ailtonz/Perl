#!/usr/bin/perl -w
# ipreport.pl- the script that sits external to your router
use strict;
use CGI;
my $q=CGI->new();
print $q->header().$q->remote_addr()."\n";