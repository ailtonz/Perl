#!c:/Perl/perl.exe -w

use strict;
use warnings;
use File::Copy;

copy("dbAnaLang_090701_1216.mdb","c:/tmp/dbAnaLang_090701_1216.mdb") or die "Copy failed: $!";
copy("dbAnaLang_090701_1216.mdb","//corregedoria/tmp/dbAnaLang_090701_1216.mdb") or die "Copy failed: $!";