use strict;
use warnings;
use Spreadsheet::WriteExcel; 
my $diretorio='C:/tmp';
opendir(IMD, $diretorio) || die("Cannot open directory");
my @thefiles= readdir(IMD);
closedir(IMD);

my $produrar = 'Monitor';

my $workbook = Spreadsheet::WriteExcel->new('C:/tmp/Lista.xls');
my $worksheet   = $workbook->add_worksheet(); 

my $i = 1;

my @arquivos = grep(/^$produrar/,@thefiles);
foreach my $f (@arquivos)
{
 unless ( ($f eq ".") || ($f eq "..") )
 { 
      $worksheet->write($i,0, $diretorio."/".$f);       
 }
 $i++;
}
$workbook->close() or die "Error closing file: $!";