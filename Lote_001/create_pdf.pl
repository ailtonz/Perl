#!C:\perl\bin
# HelloWorld.pl; adapted from 0x_test-pl

use PDF::API2;

my $pdf  = PDF::API2->new(-file => "HelloWorld.pdf");
$pdf->mediabox(595,842);
my $page = $pdf->page;
my $fnt = $pdf->corefont('Arial',-encoding => 'latin1'); 
my $txt = $page->hybrid;
$txt->textstart;
$txt->font($fnt, 20);
$txt->translate(100,800);
$txt->text("Hello World! left-aligned");
$txt->translate(500,750);
$txt->text_right("Hello World! right-aligned");
$txt->translate(300,700);
$txt->text_center("Hello World! center-aligned");
$txt->textend;
$pdf->save;
$pdf->end( );