use PDF::API2::Simple;

my $pdf = PDF::API2::Simple->new( 
								 file => 'c:\output.pdf'
								);

$pdf->add_font('VerdanaBold');
$pdf->add_font('Verdana');
$pdf->add_page();

$pdf->link( 'http://search.cpan.org', 'A Hyperlink',
			x => 350,
			y => $pdf->height - 150 );

for (my $i = 0; $i < 250; $i++) {
	 my $text = "$i - All work and no play makes Jack a dull boy";

	 $pdf->text($text, autoflow => 'on');
}

$pdf->save();