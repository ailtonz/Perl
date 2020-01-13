sub copy
{ my($from, $to) = @_;
  if(open(IN, $from))
  {  if(open(OUT, ">$to"))
     {  while(read IN, $buf, 0755)
        {   print OUT $buf;
        }
        close IN;
        close OUT;
        return 1;
     }
     close IN;
  }
  return 0;
}

copy("c:\\cp.pl", "c:\\tmp\\cp.pl") or die("cannot copy\b");