use strict;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;                                # die on errors...
my $Excel = Win32::OLE->GetActiveObject('Excel.Application')
    || Win32::OLE->new('Excel.Application', 'Quit');  # get already active Excel
                                                      # application or open new
my $Book = $Excel->Workbooks->Open("C:\\DOCUMENTS\\test.xls"); # open Excel file
my $Sheet = $Book->Worksheets(1);                     # select worksheet number 1
my $array = $Sheet->Range("A8:B9")->{'Value'};        # get the contents
$Book->Close;
foreach my $ref_array (@$array) {                     # loop through the array
                                                      # referenced by $array
    foreach my $scalar (@$ref_array) {
        print "$scalar\t";
    }
    print "\n";
}