#!/usr/bin/perl

print "Content-type:text/html\n\n";

print <<EndOfHTML;
<html><head><title>Variaveis de ambiente</title></head>
<body>
EndOfHTML

foreach $key (sort(keys %ENV)) {
    print "$key = $ENV{$key}<br>\n";
}

print "</body></html>";