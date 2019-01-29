#! \usr\bin\perl
use strict;
use warnings;

my $file ="codons.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;


my %code;
my $i = 0;
my $first;
my $second;
my $third;
my $fourth;
my $ref;


foreach (@data){
	if (/(\w)\s(\w+)/){
		if (exists $code{$1}){
			if ($i==0){
				$second = $2;
				$ref = [$first,$second];
				$code{$1} = $ref;
				$i++;
				next;
			}
			if ($i==1){
				$third = $2;
				$ref = [$first,$second,$third];
				$code{$1} = $ref;
				$i++;
				next;
			}

			if ($i==2){
				$fourth = $2;
				$ref = [$first,$second,$third,$fourth];
				$code{$1} = $ref;
				$i++;
				next;
			}
		
		}
		$first = $2;
		$ref = [$first];
		$code{$1} = $ref;
		$i =0;
		
	}
}

my $key;
my $deref;
my @a;


foreach (keys %code){
	$key = $_;
	$ref = $code{$_};
	
	@a = @$ref;	
	
	$deref = join (", ",@a);
	
	print $key,": ","$deref","\n";
	$deref = "";

}
#works

