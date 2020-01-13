#!/usr/bin/perl -w 

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

my @arquivos = grep /\.mp3$/i, readdir DIR;

foreach my $mp3file (@arquivos)
{
    $new_name = $mp3file;
    $new_name =~ s/\s+/_/g; # tira os espacos
    $new_name =~ s/_-_/-/g; # tranforma "_-_" em apenas "-"
    $new_name =~ s/^[-_]+//; # elimina '-' e '_' do inicio
    $new_name =~ s/&/and/g; # transforma & em "and"
    $new_name =~ s/[\(\)\[\]]+/_/g; # () e [] viram _
    $new_name =~ s/,/_/g;
    $new_name =~ s/\'+/_/g; # elimina as aspas
    $new_name =~ s/\`+/_/g; # elimina as crases
    $new_name =~ s/_+/_/g;  # elimina "_" sequenciais
    $new_name =~ s/-+/-/g;  # elimina "-" sequenciais

    $new_name = lc $new_name; # todas as letras ficam minusculas

    # faz a modificacao se ouve alteracao
    if ($new_name ne $mp3file)
    {
	$dir = shell_quote ($dir);
	$mp3file = shell_quote ($mp3file);
	$new_name = shell_quote ($new_name);
	system "mv $dir$mp3file $dir$new_name";
	print "\n$mp3file virou $new_name";
    }    
}

closedir DIR;
