use strict;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;                                # die on errors...
my $Excel = Win32::OLE->GetActiveObject('Excel.Application')|| Win32::OLE->new('Excel.Application', 'Quit');  # get already active Excel
                                                      # application or open new
$Excel->{'Visible'} = 1;

my $document = $Excel->Documents->Add;
													  
													  
my $Book = $Excel->Workbooks->Open("C:\\tmp\\test.xls"); # open Excel file
my $Sheet = $Book->Worksheets(2);                     # select worksheet number 1
my $array = $Sheet->Range("A11:A11")->{'Value'} = ("ABC");        # get the contents

foreach my $ref_array (@$array) {                     # loop through the array
                                                      # referenced by $array
    foreach my $scalar (@$ref_array) {
        print "$scalar\t";
    }
    print "\n";
}

$Book->Save;
$Book->Close;
