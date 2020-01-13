 # file: examples/create-pdfs.pl
  use strict;
  use PDF::Reuse;

  mkdir "out" if (!-e "out") ;

  foreach my $x (1..4) {
      prFile("out/file-$x.pdf");

      foreach my $y (1..10) {
          prText(35,800,"File: file-$x.pdf");
          prText(510,800,"Page: $y");

          foreach my $z (1..15) {
              prText(35,700-$z*16,"Line $z");
          }

          # add graphics with the prAdd function

          # stroke color
          prAdd("0.1 0.1 0.9 RG\n");

          # fill color
          prAdd("0.9 0.1 0.1 rg\n");

          my $pos = 750 - ($y * 40);

          prAdd("540 $pos 10 40 re\n");
          prAdd("B\n");

          if ($y < 10) {
              prPage();
          }
      }

      prEnd();
  }