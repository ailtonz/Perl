use PDF::API2;
$pdf=PDF::API2->new;
$pdf->mediabox('A4');
$page=$pdf->page;
$page->mediabox('A3');
$page->rotate(90); #landscape

$pdf->info(
'Author' => 'fredo',
'Title' => 'doku_demo',
);

$pdf->infoMetaAttributes('C1');
$pdf->info(
'C1' => 'Custom Field 1',
);

$imp=PDF::API2->open('some.pdf');
$page=$pdf->importPage($imp,2);
$page->mediabox('A4');
$xo=$pdf->importPageIntoForm($imp,5);
$page=$pdf->page;
$gfx=$page->gfx;
$gfx->formimage($xo, 0, 0, 0.5);
$gfx->formimage($xo, 300, 400, 0.5);
$pdf->saveas('new.pdf');

print $imp->stringify;