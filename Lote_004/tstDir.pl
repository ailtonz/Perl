#!c:\perl\bin

use strict;
use warnings;
use Cwd; # para getcwd()

unless ($ARGV[0]) 
{
    my $dir = getcwd;
	unless ($dir =~ /[\/]$/) { $dir .= "/"; }
print $dir;
	}

