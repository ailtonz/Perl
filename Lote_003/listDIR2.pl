#!c:/Perl/perl.exe -w

use strict;
use warnings;

my $dirname = "C:/Tmp/e-Mails";
my $filename;


opendir ( DIR, $dirname ) || die "Error in opening dir $dirname\n";

while(($filename = readdir(DIR)))
{
	unless ( ($filename eq ".") || ($filename eq "..") ) 
	{ 
		print("$filename\n");
	} 
}

closedir(DIR);