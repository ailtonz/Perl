@NotasEscolares = (1,4,7,2,X,3,0,1,6,3,1,8,R,G,9,2,3,4,1,1,3);
$CadeiaDeNotas = join(",",@NotasEscolares);
$CadeiaDeNotas =~ s/[7-9]|0|[A-Z]//gi;
@NovasNotas = split(/,|,,/,$CadeiaDeNotas);
for(@NovasNotas) {
   unless($_ eq "") { print $_, "\n"; }
}