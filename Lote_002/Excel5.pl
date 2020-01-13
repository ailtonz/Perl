use Spreadsheet::WriteExcel;                             # Step 0

my $workbook = Spreadsheet::WriteExcel->new('C:/tmp/perl.xls'); # Step 1
$worksheet   = $workbook->add_worksheet();               # Step 2
$worksheet->write('A1', 'Hi Excel!');                    # Step 3