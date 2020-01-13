#!/usr/bin/perl

$dirtoget="C:/Tmp";
opendir(IMD, $dirtoget) || die("Cannot open directory");
@thefiles= readdir(IMD);
closedir(IMD);

open (MYFILE, '>>data.html');

print MYFILE "Content-type: text/html\n\n";
print MYFILE "<html><body>";

foreach $f (@thefiles)
{
 unless ( ($f eq ".") || ($f eq "..") )
 { 
  print MYFILE "$f<br />";
 }
}

print MYFILE "</body></html>";