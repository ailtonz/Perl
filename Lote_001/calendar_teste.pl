#!C:\perl\bin -w

  use strict;
  use Calendar::Simple;

  my @months = qw(Janeiro Fevereiro Marco Abril Maio Junho Julho Agosto
                  Setembro Outubro Novembro Dezembro);

  my $mon = shift || (localtime)[4] + 1;
  my $yr  = shift || (localtime)[5] + 1900;

  my @month = calendar($mon, $yr);

  print "\n$months[$mon -1] $yr\n\n";
  print "D  S  T  Q  Q  S  S \n";
  foreach (@month) {
    print map { $_ ? sprintf "%2d ", $_ : '   ' } @$_;
    print "\n";
  }