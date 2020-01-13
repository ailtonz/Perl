#!/usr/bin/perl
use strict;
use warnings;

my @materia;
	$materia[0] = "Sociologia";
	$materia[1] = "Calculo vetorial";
	$materia[2] = "Fisica 1";
	$materia[3] = "Fisica EE";
	$materia[4] = "Geometria Analitica";
	
my @notas = (9.5,7.5,9,7,10);
my $curso = "Engenharia de pruducao plena";
my $ano = "2006/1";
my $nome = "Mirna Mota Passos";

print "Curso: $curso\n";
print "Ano: $ano\n";
print "Nome do Aluno: $nome\n";
print "***** Notas da Primeira Avaliação*****\n";
print "MATERIAS \t NOTAS\n";
print "$materia[0]\t\t	$notas[3]\n";
print "$materia[1]\t\t	$notas[4]\n";
print "$materia[2]\t\t	$notas[0]\n";
print "$materia[4]\t\t	$notas[2]\n";
print "$materia[3]\t\t	$notas[1]\n";