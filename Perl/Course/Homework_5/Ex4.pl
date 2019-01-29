#! / usr / bin / perl
use warnings ;
use strict ;

sub report_error{
	my $time = localtime;
	my $error = @_;
	print "@_! ||$time.\n";
}
my $file = "non.txt";
my $test = "Could not open $file! ";

open (READ, "$file") || report_error ($test);
close READ;	

#works
