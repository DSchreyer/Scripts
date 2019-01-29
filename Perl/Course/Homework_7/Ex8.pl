#! / usr / bin / perl
use warnings ;
use strict ;


my $i;
for ($i=0;$i<11;$i++){
	my $n = int(rand(10))+1;
	my @rand = ("\$","\*","\,");
	my $n2 = int(rand(3));
	#print "@rand\n";
	print "please enter $n $rand[$n2] :\n";
	my $stdin = <STDIN>;
	chomp $stdin;
	my $answer = $rand[$n2] x $n;
	if ("$answer" eq "$stdin"){
		print "Correct!\n";
	}
	else{die "Incorrect!\n";}
}
