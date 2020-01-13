opendir(DIR,".") || print "Falhou!";
while($file=readdir(DIR)){print $file,"\n";}
rewinddir(DIR);
while($file=readdir(DIR)){print $file,"\n";}
close(DIR);