#! \usr\bin\perl
use strict;
use warnings;

my $file = "preProInsulinRecords.gp";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my %journal;

my $year;
my $between;


foreach (@data){
	if (/(JOURNAL)(\s+([a-zA-Z\.\s]+)(.+)\()([0-9]+)(\))/){ #$4 ist Jahr, $2 ist Name
		if (exists $journal{$3}){
			$journal{$3} .= " $5";
			next;
		}
		$year = $5;
		$journal{$3} = $year;
	}
}

while (my ($key, $value) = each %journal){
	print "$key: $value\n";
}