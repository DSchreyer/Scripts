#! / usr / bin / perl
use warnings ;
use strict ;

my $lifeexp = 70;

print "what is your gender? ";

my $gender = <STDIN>;
chomp $gender;
if ($gender eq "male"){
	$lifeexp = $lifeexp - 2;
}	
if ($gender eq "female"){
	$lifeexp = $lifeexp + 2;
}
print "Your Life expectancy is $lifeexp years.\n";

print "Do you smoke?";
my $smoke = <STDIN>;
chomp $smoke;
if ($smoke eq "yes"){
	$lifeexp = $lifeexp - 5;
}
if ($smoke eq "no"){
	$lifeexp = $lifeexp +5;
}
print "Your Life expectancy is $lifeexp years.\n";

print "Do you exercise?";
my $ex = <STDIN>;
chomp $ex;
my $often;
if ($ex eq "yes"){
	print "How many days per week do you exercise?";
	$often = <STDIN>;
	$lifeexp = $lifeexp + $often; 
}

if ($smoke eq "no"){
	$lifeexp = $lifeexp -3;
}
print "Your Life expectancy is $lifeexp years.\n";

print "Do you drink alcohol?";
my $drink = <STDIN>;
chomp $drink;
if ($drink eq "yes"){
	$lifeexp = $lifeexp - 2;
} else {
	$lifeexp = $lifeexp + 2;

}
print "Your Life expectancy is $lifeexp years.\n";

print "Do you eat fatty food?";
my $food = <STDIN>;
chomp $food;
if ($food eq "yes"){
	$lifeexp = $lifeexp - 3;
} else {
	$lifeexp = $lifeexp + 3;

}
print "Your Life expectancy is $lifeexp years.\n";