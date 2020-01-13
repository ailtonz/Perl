use PDF::API2;

# Create a blank PDF file
$pdf = PDF::API2->new();

# Open an existing PDF file
$pdf = PDF::API2->open('some.pdf');

# Add a blank page
$page = $pdf->page();

# Retrieve an existing page
$page = $pdf->openpage($page_number);

# Set the page size
$page->mediabox('Letter');

# Add a built-in font to the PDF
$font = $pdf->corefont('Helvetica-Bold');

# Add an external TTF font to the PDF
$font = $pdf->ttfont('/path/to/font.ttf');

# Add some text to the page
$text = $page->text();
$text->font($font, 20);
$text->translate(200, 700);
$text->text('Hello World!');

# Save the PDF
$pdf->saveas('/path/to/new.pdf');