#!/usr/bin/perl 
use CGI qw(:standard); 
my $cgi = new CGI; 
my $count = 0; 
use CGI::Carp qw(fatalsToBrowser); 
$title=$cgi->param('title'); 
$html=$cgi->param('htmltable'); 
$type = $cgi->param('type'); 
if ($type = "CSV") { 
print $cgi->header(-expires=>'now', -type=>'application/x-csv', -content_disposition=>"attachment; filename=$title.csv"); 
print "$html"; 
} 
else { 
print $cgi->header(-expires=>'now', -type=>'application/octet_stream', -content_disposition=>"attachment; filename=$title.xls"); 
print $cgi->start_html(-title => 'Export' 
); 
print "$html"; 
print $cgi->end_html;