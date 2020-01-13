#!c:\perl\bin

use strict;
use warnings;
use Cwd; # para getcwd()
use File::Copy;
my $dir;

unless ($ARGV[0]){$dir = getcwd;}else{$dir = $ARGV[0];}	
unless ($dir =~ /[\/]$/) { $dir .= "/"; }

opendir (DIR, $dir) or die $!;

my @arquivos = grep /\.txt$/i, readdir DIR;

foreach my $mp3file (@arquivos){print $dir.$mp3file."\n";}

closedir DIR;

