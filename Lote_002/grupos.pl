#!C:\perl\bin
use strict;
use warnings;
use Template;

my @grupos = (
   { nome => 'Salvador Perl Mongers',  lider => 'Joenio Costa', link => 'salvador.pm.org' },
   { nome => 'Fortaleza Perl Mongers', lider => 'Daniel Ruoso', link => 'fortaleza.pm.org' },
   { nome => 'Brasil Perl Mongers',    lider => 'Flavio Glock', link => 'brasil.pm.org' },
);

my $tmpl = Template->new({
   INCLUDE_PATH => $ENV{PWD},
   OUTPUT_PATH => $ENV{PWD},
});

$tmpl->process('grupos.tmpl', {grupos => \@grupos}) or die $tmpl->error();