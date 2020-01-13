my $pdf = PDF::FromHTML->new( encoding => 'utf-8' );

# Loading from a file:
$pdf->load_file('boleto.html');

# Or from a scalar reference:
# $pdf->load_file(\$input);

# Perform the actual conversion:
$pdf->convert(
	# With PDF::API2, font names such as 'traditional' also works
	Font        => 'font.ttf',
	LineHeight  => 10,
	Landscape   => 1,
);

# Write to a file:
$pdf->write_file('target.pdf');

# Or to a scalar reference:
# $pdf->write_file(\$output);