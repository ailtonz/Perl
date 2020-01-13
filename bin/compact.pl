#!perl
use strict;
use Win32::OLE;
use Win32::OLE qw( in );
use File::Copy;

my ($dbf, $dbt, $dbs, $app, $dbe);
my @dberrors;
my %dbp;

$dbf = 'C:\Program Files\MicrosoftOffice\Office\Samples\Northwind.mdb';
$dbt = $ENV{TEMP} . '\\' . time() . '.mdb';

#does the db file exists?
unless (-f $dbf) {
	 die("Can't locate database file: '$dbf'");
}

#let's create a new application object
unless ($app=Win32::OLE->new('Access.Application')) {
	 die("Error creating Access Application");
}

#and get a reference to the db engine
$dbe = $app->{DBEngine};

#let's repair the db file
$dbe->RepairDatabase($dbf);
unless (CheckDBErrors($dbe, \@dberrors)) {
	 die ("Error repairing database.", @dberrors);
} else {
	 print "Database repaired.\n";
}

#let's compact an existing db file to a temporary db file
$dbe->CompactDatabase($dbf, $dbt);
$dbs = $dbe->OpenDatabase($dbt)
	 or die "Error opening compacted database: '$dbt'.";
$dbs->Version
	 or die "Error getting database version!";
$dbs->Close;
print "Database compacted.\n";

#let's overwrite the original db file
move($dbt,$dbf) or die("Error overwriting original db: $!");

#close the OLE object
$app->Quit();

sub CheckDBErrors {
	 my $dbe = shift;
	 my $arrayref = shift;
	 my $errors = $dbe->Errors();
	 my $count = 0;
	 foreach my $error (in $errors) {
			 next if $error->{Number} == 0; # Skip warnings
			 $count++;
			 push @{$arrayref},
					 "Error: [$error->{Number}] $error->{Description}";
	 }
	 $errors->Clear();
	 return $count == 0 ? 1 : 0;
}