#! \usr\bin\perl
use strict;
use warnings;


my %os = ( "MVS " => "5.2.1 ","Windows " => "NT ","OS /2 " => "Merlin ","Linux " => "2.2 ",
"HP -UX " => "10 ",
"Solaris "=> "2.5 ",
"Mac " => "Copland " );

my @sorted_keys = sort {$a cmp $b} keys %os;

my @sorted_values = sort {$os{$a} cmp $os{$b}} keys %os;

foreach (@sorted_keys){
	print "$_ $os{$_}\n";
}
print "\n";
foreach (@sorted_keys){
	print "$_ $os{$_}\n";
}
	 