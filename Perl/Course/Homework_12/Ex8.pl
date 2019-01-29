#! / usr / bin / perl
use strict ;
use warnings ;
use File::Spec;
use Cwd;
use File::Basename;

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
	my ($filename,$dirs) = fileparse($_);
	print $filename,"\t",$dirs,"\n";
}