#!/usr/bin/perl

$dirtoget="/home/yourname/www/images/";
opendir(IMD, $dirtoget) || die("Cannot open directory");
@thefiles= readdir(IMD);
closedir(IMD);

print "Content-type: text/html\n\n";
print "<html><body>";

foreach $f (@thefiles)
{
 unless ( ($f eq ".") || ($f eq "..") )
 { 
  print "$f<br />";
 }
}

print "</body></html>";