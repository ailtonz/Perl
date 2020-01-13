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
             ('C:\report\results\check_all.csv'); # open Excel file
$Sheet = $Book->Worksheets(1);

# Create New Workbook
$Excel->{SheetsInNewWorkBook} = 1;
$Book2 = $Excel->Workbooks->Add();
$Sheet2 = $Book2->Worksheets(1);
$Sheet2->{Name} = 'My test worksheet';

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

# Cell Values
$Sheet->Range('a1')->{Value} = $Sheet->Range('b2')->{Value};

# Resize Columns
my @columnheaders = qw(A:B);
    foreach my $range(@columnheaders){
        $Sheet->Columns($range)->AutoFit();
    }
# Order Rows
$tmp = "$mylastcol2".'3';
$Rangea = $Sheet->Range("$tmp");
$Rangeb = $Sheet->Range("a3");
$Excel->Selection->Sort({Key1 => $Rangea,
                         Order1 => xlDescending,
                         Key2 => $Rangeb});

# Merge Cells
$mynextcol = 'b';
for (my $n=1;$n<$LastCol;$n+=2)
{
  my $range = $mynextcol++ . '1:' . $mynextcol++ . '1';
  $Sheet->Range($range)->Merge();
  $Sheet->Range($range)->{HorizontalAlignment} = xlHAlignCenter;
}

# Pie Chart
my $Range = $Sheet->Range('a1:d2');
my $Chart = $Book->Charts->Add;
$Chart->ChartWizard($Range,xl3DPie,7,xlRows,1,0,2,"Sales Percentages");

# Bar Graph and Rotate
my $Range = $Sheet->Range('a1:a3');
my $Chart = $Excel->Charts->Add;
$Chart->{Type} = xl3DColumn;
for (my $i = 30; $i <=180; $i+=10)
{
  $Chart->{Rotation} = $i;
  sleep(1);
}

# Line Chart and Save
my $Range = $Sheet->Range('a1:d2');
my $Chart = $Excel->Charts->Add;
$Chart->{ChartType} = xlLine;
$Chart->SetSourceData({Source => $Range, PlotBy => xlColumns});
$Chart->{HasTitle} = 1;
$Chart->ChartTitle->{Text} = "Some Title";

my $ChartObj = $Sheet->ChartObjects;

$Chart->Export({
               FileName   => $filegraphname,
               FilterName => 'GIF',
               Interactive  => 0});

# Save as PDF
$Excel->ActiveWindow->SelectedSheets->PrintOut({
               Copy => 1,
               ActivePrinter => 'Acrobat PDFWriter'});

# Save as Excel
$Book->SaveAs({Filename =>'C:\report\results\check_all.xls',
              FileFormat => xlWorkbookNormal});  
$Book->Close();
$Excel->Quit();  
