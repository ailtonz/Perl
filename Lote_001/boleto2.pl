use HTML::HTMLDoc;
use strict;
####################################################
# This script is distributed according to the terms of
# the Perl Artistic License. Use at your own risk
# © 2004 Philip L. Yuson
####################################################

my $str = '
<html>
<body>
<p><font size=14pt><b>HTML to PDF Document</b></font></p>
<p>Let us see how this will work</p>
<table border=1>
<tr><td>This is a row in a table</td></tr>
<tr><td>This is another row</td></tr>
</table>
<HR>
copyright © 2004 Philip L. Yuson 
</body>
</html>';

my $html = new HTML::HTMLDoc(); # Start instance
$html->set_page_size('letter'); # set page size
$html->set_bodyfont('Arial'); # set font
$html->set_left_margin(1, 'in'); # set margin
$html->set_html_content($str); # contents to convert
my $pdf = $html->generate_pdf(); # generate document

$pdf->to_file('article.pdf'); # save document