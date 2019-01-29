#! / usr / bin / perl
use warnings ;
use strict ;

sub subroutine ($){
	my $i = @_+0;
	my $argument = $_[0];
	print "$argument\n";
	print "numbers of arguments: $i.\n";
	

}	
my $scalar1 = "1";
my $scalar2 = "2";
my @array = (1,2,3,4);

subroutine (@array);

#prototype ($) prints 4. so it takes the last argument
#two scalars --> $ --> $$

#works
