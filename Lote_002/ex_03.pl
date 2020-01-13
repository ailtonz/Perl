#!/usr/bin/perl

print "Content-type:text/html\n\n";

print <<EndOfHTML;
<html><head><title>Variaveis de ambiente</title></head>
<body>
EndOfHTML



my @array = (1,3,5,7,9);
my $i;

foreach $i (@array){print "$i\n"};

print "</body></html>";