#!/usr/bin/perl -w

open(GRADES,"c:\\teste\grades.txt") or die "Impossivel abrir arquivo grades: $!\n";
While ($linha = <GRADES>) { 
($student, $grade) = (" ",$linha); 
$grades{$student} .= $grade . " "; 
}


foreach $student (sort keys %grades) {
$scores = 0;
$total = 0;
@grades = split(" ",$grades{$stundent});
foreach $grade(@grades) {
$total += $grade;
$scores++;
}
$average = $total / $scores;
print "$student: $grades{$student}\tAverage: $average\n";
}
