opendir(DR,"/windows");
@folders = readdir(DR);
foreach $folder (@folders) {
   print $folder,"\n";
}
closedir(DR);