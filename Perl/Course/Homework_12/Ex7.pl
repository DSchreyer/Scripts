#! / usr / bin / perl
use strict ;
use warnings ;
use File::Spec;
use Cwd;


my $curdir = File::Spec->curdir();

use Cwd 'abs_path';


my $path;
my @paths;

opendir (DH,$curdir) or die "Cannot open $curdir!\n";
foreach (readdir DH){
	chomp;
	$path = abs_path($_);
	push (@paths,"$path");
}

foreach (@paths){
	print "    ",$_,"\n";
}

#halbe fertig
#muss noch geprintet werden mit einem module
