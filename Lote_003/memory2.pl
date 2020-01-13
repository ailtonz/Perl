use GTop;
my $proc_mem = GTop->new->proc_mem($$);
my $diff     = $proc_mem->size - $proc_mem->share;
print "Difference is $diff bytes\n";