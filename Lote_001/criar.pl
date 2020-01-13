#!c:\perl\bin

use strict;
use warnings;
use String::ShellQuote; # seguranca, "escapa" uma string para o bash
use Cwd; # para getcwd()

my $dir;

unless ($ARGV[0]) 
{
	$dir = getcwd;
}
else
{
     $dir = $ARGV[0]; # nao vem
}	

unless ($dir =~ /[\/]$/) { $dir .= "/"; }

opendir (DIR, $dir) or die $!;

my @ListarArquivos = grep /\.txt$/i, readdir DIR;

print @ListarArquivos;


closedir DIR;