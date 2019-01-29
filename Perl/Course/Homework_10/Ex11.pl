#! \usr\bin\perl
use strict;
use warnings;

my $file1 ="seq.data4.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;

my $file2 ="ann.data4.txt";

open (READ,$file2) or die "Cannot open $file2!";
my @data2 = <READ>;
chomp @data2;
close READ;

my $file3 ="gi.data4.txt";

open (READ,$file3) or die "Cannot open $file3!";
my @data3 = <READ>;
chomp @data3;
close READ;


my %proteins;
my $sequence;
my $ann;
my $Gindex;
my @aref;
my $ref;


print %proteins,"\n";

$sequence = undef;
$ann = undef;
$Gindex = undef;

foreach (@data1){ 

	if (/(WD_[0-9]+)\t([ACGT]+)/){
		$sequence = $2;
		$proteins {$1} = [$sequence,$ann,$Gindex];
	}
}


foreach (@data2){
	if (/(WD_[0-9]+)\s([a-zA-Z\s0-9]+)$/){
		$ann = $2;
		$proteins {$1} = [$sequence,$ann,$Gindex];
	}
}
	
foreach (@data3){
	if (/(WD_[0-9]+)\t([0-9]+.[0-9])$/){
		$Gindex = $2;
		$proteins {$1} = [$sequence,$ann,$Gindex];
	}
}	

my $ref;

my $key;
my @aref;

foreach (keys %proteins){
	$key = $_;
	$ref = $proteins{$_};
	
	@aref = @$ref;
	foreach (@aref){			#oder mit join ("\t",@a)
		print "$_\t";
	}

}

#problem: Letztes wird immer als $sequence gespeichert doer $ann..., --> die arrays haben immer die selben Daten
