use File::Copy;

my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$month++;

$origem = 'dbRetec.mdb';
$destino = 'C:\\tmp\\'.$year.$month.$dayOfMonth.$hour.'dbRetec.mdb';
#.$year.$month.$dayOfMonth.$hour.

copy($origem,$destino) or die "Copy failed: $!";