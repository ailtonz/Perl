#!/usr/bin/perl
use date::Format;

print time2str("%D", time), "\n";
# (prints 10/09/04)

print time2str("%m/%d/%Y", time), "\n";
# (prints 10/09/2004) 