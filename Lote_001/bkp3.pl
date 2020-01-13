use File::Copy;

# Create a Zip file
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
my $zip = Archive::Zip->new();

my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$month++;

$origem = 'dbRetec.mdb';
$destino = ''.$year.$month.$dayOfMonth.$hour.'dbRetec.mdb';

copy($origem,$destino) or die "Copy failed: $!";

# Add a file from disk
my $file_member = $zip->addFile( $destino );

# Save the Zip file
unless ( $zip->writeToFileNamed('bkp-v01.zip') == AZ_OK ) {
   die 'write error';
}

# Delete file
unlink($destino);