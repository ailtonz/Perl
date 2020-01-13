# Sets up a distribution with the following options
my $distribution = Perl::Dist::WiX->new(
		msi               => 1,
		trace             => 1,
		build_number      => 1,
		image_dir         => 'C:\myperl',
		download_dir      => 'C:\cpandl',
		output_dir        => 'C:\myperl_build',
		temp_dir          => 'C:\temp',
		app_id            => 'myperl',
		app_name          => 'My Perl',
		app_publisher     => 'My Perl Distribution Project',
		app_publisher_url => 'http://test.invalid/',
);

# Creates the distribution
$distribution->run();