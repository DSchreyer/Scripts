#! /usr/bin/perl

use strict;
use warnings;

#Exercise10
my %pdb2sprot;
#print "First File please(pdb2sprot):";
#my $file=<STDIN>;
#chomp $file;
my $file="pdb2sprot.txt";
open (READ, $file)||die "Failed to open $file \n";
while (<READ>){
	if (/^(.+?)\s+?(.+?)$/){
		$pdb2sprot{$1}=$2;
	}
}
close(READ);
print "PDB ids please:";
my @pdbids=<STDIN>;
chomp @pdbids;
my @pdbsorted=sort {$a cmp $b} @pdbids;
my @sprotidssorted;
foreach (@pdbsorted){
	if (defined $pdb2sprot{$_}){
		push(@sprotidssorted,$pdb2sprot{$_});
	} else {
		die "One ore more PDB ids is invalid \n";
	}
}
print "@sprotidssorted \n";
my %result;
my $test=0;
my $test2=0;
my $id;
#print "Second File please(uniprot):";
#my $file2=<STDIN>;
#chomp $file2;
my $file2="part.uniprot_sprot.dat";
open (READ, $file2)||die "Failed to open $file2 \n";
while (<READ>){
	if (/^ID\s+?($sprotidssorted[0]).+?$/){
		$id=$1;
		print "$id \n";
		$result{$id}={};
		$test=1;
		$result{$id}->{'Accession'}=[];
		$result{$id}->{'Organism'}=[];
		$result{$id}->{'Organelle'}=[];
		$result{$id}->{'Sequence'}=[];
	} elsif (/^AC\s+?(.+?)$/ and $test==1){
		if (exists $result{$id}->{'Accession'}){
			push(@{$result{$id}->{'Accession'}},$1);
		} else {
			$result{$id}->{'Accession'}=[$1];
		}
	} elsif (/^OS\s+?(.+?)$/ and $test==1){
		if (exists $result{$id}->{'Organism'}){
			push(@{$result{$id}->{'Organism'}},$1);
		} else {
			$result{$id}->{'Organism'}=[$1];
		}
	} elsif (/^OG\s+?(.+?)$/ and $test==1){
		if (exists $result{$id}->{'Organelle'}){
			push(@{$result{$id}->{'Organelle'}},$1);
		} else {
			$result{$id}->{'Organelle'}=[$1];
		}
	} elsif (/^SQ.+?$/ and $test==1){
		$result{$id}->{'Sequence'}=[];
		$test2=1;
	} elsif (/^\s+?([A-Za-z][A-Za-z\s]+?)\n$/ and $test2==1){
		push(@{$result{$id}->{'Sequence'}},$1);
	} elsif (/^\/\/$/){
		$test=0;
		$test2=0;
	}
}
close(READ);
foreach (@pdbsorted){
	if (exists $result{$pdb2sprot{$_}}){
		print "$_ ",@{$result{$pdb2sprot{$_}}->{'Accession'}},"\t",@{$result{$pdb2sprot{$_}}->{'Sequence'}},"\t",@{$result{$pdb2sprot{$_}}->{'Organism'}},"\t",@{$result{$pdb2sprot{$_}}->{'Organelle'}},"\n";
	}
}

