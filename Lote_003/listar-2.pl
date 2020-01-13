opendir (DIR,"C:/Tmp/RTM/e-Mails/ENVIADOS") || print "N\x{00e3}o \x{00e9} possivel abrir \n";
@dir = readdir(DIR);
print @dir;