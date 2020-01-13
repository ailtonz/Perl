use File::Copy;

copy("c:\\RPT-LIMS_2003.mdb","c:\\tmp\\RPT-LIMS_2003.mdb") or die "Copy failed: $!";