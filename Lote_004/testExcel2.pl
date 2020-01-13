use Win32::OLE;
use Win32::OLE qw(in with);
use Win32::OLE::Variant;
use Win32::OLE::Const 'Microsoft Excel';

$Excel = Win32::OLE->GetActiveObject('Excel.Application') ||
	   Win32::OLE->new('Excel.Application');
$Excel->{'Visible'} = 0;		#0 is hidden, 1 is visible
$Excel->{DisplayAlerts}=0;	#0 is hide alerts

# Open File and Worksheet
my $Book = $Excel->Workbooks->Open
             ('C:\tmp\Pasta1.xls'); # open Excel file
$Sheet = $Book->Worksheets(1);
$Sheet->{Name} = 'My test worksheet';

# Find Last Column and Row
my $LastRow = $Sheet->UsedRange->Find({What=>"*",
    SearchDirection=>xlPrevious,
    SearchOrder=>xlByRows})->{Row};

my $LastCol = $Sheet->UsedRange->Find({What=>"*", 
                  SearchDirection=>xlPrevious,
                  SearchOrder=>xlByColumns})->{Column};

$mylastcol = a;
for (my $m=1;$m<$LastCol;$m++){$mylastcol++;}
$mylastcol2 = a;
for (my $m=1;$m<($LastCol - 1);$m++){$mylastcol2++;}


# Draw Borders
my @edges = qw (xlInsideHorizontal xlInsideVertical);
$range = "a1:$mylastcol$LastRow"; 
foreach my $edge (@edges)
{
  with (my $Borders = $Sheet->Range($range)->Borders(eval($edge)), 
          LineStyle =>xlContinuous,
          Weight => xlThin ,
          ColorIndex => 1);
}

# Resize Columns
my @columnheaders = qw(A:B);
foreach my $range(@columnheaders)
{
	$Sheet->Columns($range)->AutoFit();
}



# Save as Excel
$Book->SaveAs({Filename =>'C:\tmp\Pasta2.xls',
              FileFormat => xlWorkbookNormal});  
$Book->Close();
$Excel->Quit();  
