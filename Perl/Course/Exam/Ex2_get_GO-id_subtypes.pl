#! /usr/bin/perl
use strict;
use warnings;

#this subroutine gets an array of go ids and searches for them and returns the subtypes of the given go ids
sub subtype_search{
	my @subid = @{$_[0]};#the new go ids are there 
	my @subdata = @{$_[1]}; #data
	my $subcounter = 0;
	my $subid;
	my $subsubtype;
	my $sublocated ="notlocated"; 
	my @subsubtypes=(); #array for the found subtypes 

	foreach $subid(@subid){
		foreach (@subdata){
			if (/^id:\s($subid)$/){	#is searching for the GO id.
				$sublocated = $subid; #if GO id is located save it in $sublocated
				next;
			}
			if ($sublocated eq $subid){ #checks if the Go id was located
				if (/^\[Term\]$ / or /^$/){ #if the next Term is located or the string is empty --> no more subtype 
					last; #end the foreach loop
				}
				if (/^is_a:\s(GO:[0-9]{7})\s!\s.+$/){ #searches for the next subtype in the file
					$subsubtype = $1; #subtype go id is stored in $subsubtype
					push (@subsubtypes, $subsubtype); #store all subtypes of this go id in an array
					$subcounter = 1; #counter set to 1 to know if the program located the first subtype
					next;
				}
			}
			if ($subcounter == 1 and $_ !~ /^is_a:\s(GO:[0-9]{7})\s!\s.+?/){ #if a subtype was located and the next line is not another subtype 
				$subcounter = 0; #resets counter
				$sublocated = "notlocated"; #resets located
				last;
			}
		}
	}
	return (@subsubtypes);
}



my $file = "go-basic.obo"; #filename 



print "Enter a Go id and I will print its subtypes: ";
my $id = <STDIN>;
chomp $id;

while ($id !~ /^GO:[0-9]{7}$/){ #as long as the go id does not match the expectation ask for another Go id
	warn "This is not a valid GO:ID!\n";
	print "Enter a valid Go id: ";
	$id = <STDIN>;
	chomp $id;
}



my @data;
open (READ, $file)||die "Failed to open $file!\n"; #
@data = <READ>;

my @subtypes; #array for the first subtypes of the entered go id 
my @allsubtypes;#array for all the foundsubtypes
my $subtype; #stores the found subtype in this string
my $namespace; #stores the namespace
my $name; #stores the name
my $i = 0; #an index for checking, if a subtype was located
my $located ="notlocated"; #$GOID is not located yet --> $located = notlocated

#searches for the entered GoID and saves the name, namespace, and the first subtypes
foreach (@data){
	chomp;
	if (/^id:\s($id)/){ #if the entered go id is found
		$located = $id; #located is now the new go id
		next;
	}
	if ($located eq $id){ #checks if the Go id was located
		if (/^name:\s(.+)?/){ #searchs the name of the given Go id
			$name = $1; #the name is now stored in $name
			next;
		}
		if (/^namespace:\s(.+)$/){ #searchs the namespace of the given Go id
			$namespace = $1; #the name is now stored in $name
			next;
		}
		if (/^is_a:\s(GO:[0-9]{7})\s!\s.+$/){ #searches for the subtypes of the entered Go id
			$subtype = $1; #subtype go id is stored in $subtype
			push (@subtypes, $subtype); #store all subtypes of this go id in an array
			push (@allsubtypes,$subtype); #stores it in allsubtypes aswell --> an array for every found subtype
			$i =1; #sets counter to 1 if a subtype is located 
			next;
		}
	}
	if ($i == 1 and $_ !~ /^is_a:\s(GO:[0-9]{7})\s!\s.+$/){ #if a subtype was located and the next line is not another subtype 
		last; #everything is done --> end this loop 
	}
}

if ($located eq "notlocated"){ #if the entered GO id was not loceted --> die 
	die "This is not a GO:ID!\n";
}

#this while loop is calling a subroutine, which takes as input the newest found subtypes and returns their subtypes. 
while ($#subtypes != -1){ #if a array has no elements --> the length = -1, means if no further subtypes found --> end this loop
	@subtypes = subtype_search(\@subtypes,\@data); #takes also data as an input, where my file is stored
	push (@allsubtypes,@subtypes); #stpres every subtype in an array
}

#sorts according to the zero-padded seven digit identifer. compare is possible, because every is_a starts with GO:...
my @sortedsubtypes = sort {$a cmp $b}@allsubtypes; 

my $subtype2=""; #declare a new string to check if a subtypes is already present in an array
my @uniquesubtypes =(); #stores every subtype once in this array
foreach (@sortedsubtypes){
	my $subtype1 = $_; 
	
	if ($subtype2 eq $subtype1){ #if the subtype is already in the array --> do nothing
		next;
	}
	else{
		push (@uniquesubtypes,$subtype1); #if its a unique subtype --> push it in this array
	}
	$subtype2 = $subtype1; #stores this subtype in subtype2 string --> able to check if the next subtype is equal to this one
}	

print "$id\t$name\t$namespace\n"; #prints the id, name and namespace 
print "is_a:";
foreach (@uniquesubtypes){ #prints all the subtypes in a nice looking way
	print "\t$_\n";
}

#¯\_(ツ)_/¯

	
	