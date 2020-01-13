#!c:\perl\bin

# Autor: José Ricardo da Silva (zehzinho@gmail.com)
#
# Renomeia os arquivos mp3, de forma que os espacos e caracteres estranhos
# sejam removidos
# 
# Uso: ./rightmp3names.pl <dir>
# Se "dir" nao for passado, usa-se o diretorio atual
#
# Para instalar String::ShellQuote use Cpan
# cpan (enter)
# install String::ShellQuote

use strict;
use warnings;
use String::ShellQuote; # seguranca, "escapa" uma string para o bash
use Cwd; # para getcwd()
use File::Copy;
my $dir;
my $new_name;

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

my @arquivos = grep /\.txt$/i, readdir DIR;


foreach my $mp3file (@arquivos)
{
 	print $dir.$mp3file."\n";
	copy($dir.$mp3file, $dir."tmp2/".$mp3file) or die "Copy failed: $!";
	
}

closedir DIR;