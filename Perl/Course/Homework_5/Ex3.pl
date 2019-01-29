#! / usr / bin / perl
use warnings ;
use strict ;

sub one {
	print "This is subroutine $i.\n";
	$i++;
	return ($i);
}

sub two{
	print "This is subroutine $i.\n";
	$i++;
	return ($i);
}

sub three{
	$i=3;
	print "This is subroutine $i.\n";
	return $i;
}
my $i=1;

if ($i eq 1){
	one ();
}
if ($i eq 2){
	two ();
}
if ($i eq 3){
	three ();
}

#works
