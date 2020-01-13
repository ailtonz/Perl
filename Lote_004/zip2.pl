# Create a Zip file
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
my $zip = Archive::Zip->new();

# Add a file from disk
my $file_member = $zip->addFile( 'dbRetec.mdb' );

# Save the Zip file
unless ( $zip->writeToFileNamed('someZip.zip') == AZ_OK ) {
   die 'write error';
}