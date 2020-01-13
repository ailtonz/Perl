my $pdf = PDF::FromHTML->new( encoding => 'utf-8' );
$pdf->load_file('boleto.html');       
$pdf->convert();        
$pdf->write_file('output.pdf');