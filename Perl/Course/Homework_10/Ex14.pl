#! \usr\bin\perl
use strict;
use warnings;

my $file1 ="matrix.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;

my $i = 1;
my %row;


foreach (@data1){
	if (/([0-9]*)\s([0-9]*)\s([0-9]*)/){
		$row{$i} = [$1,$2,$3];
	}
		$i++;
}
#works

print "Do you want to enter some numbers (yes/no)? ";
my $answer = <STDIN>;
chomp $answer;

my $number1;
my $number2;
my $numbers;
my $first;
my $second;
my @first;
my @second;
my @sum;
my $j;

while ($answer eq "yes"){

	print "Enter two numbers(e.q. 1,3): ";
	
	$numbers = <STDIN>;
	chomp $numbers;
	

	if ($numbers =~ /([0-9]+),([0-9]+)/){
		$number1 =$1;
		$number2 =$2;
		
	}
	else { die "These are not two numbers\n"}

	#works

	$first = $row{$number1};
	$second = $row{$number2};

	@first = @$first;
	@second = @$second;

	$j=0;

	for ($j;$j<scalar(@first);$j++){
		$sum[$j] = $first[$j]+$second[$j]; #useless use of private variable in void context ?
	}
	
	print @sum,"\n";

	print "Do you want to enter some more numbers (yes/no)? ";
	$answer = <STDIN>;
	chomp $answer;
}