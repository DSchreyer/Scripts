#! /usr/bin/perl
use strict;
use warnings;

my %regions; #all regions are in this Hash
my $name;

my $numcommands = $#ARGV+1; 
if ($numcommands > 1 or $numcommands < 1){ #checks if more than one command line argument is entered
	die "Please enter a file as a command line argument!\n"; #dies if more than one command line argument is entered
}

my $file= "$ARGV[0]"; #$file in the command line argument
open (READ, $file)||die "Failed to open $file. Write one file in the command line argument!\n"; #
while (<READ>){
	chomp; #removes "\n" on last field
	
	#matches every region with a transposon
	if (/^(?<chromosome>chr(.)+)\t(?<regionstart>[0-9]+)\t(?<regionend>[0-9]+)\t(chr(.)+)\t(?<transstart>[0-9]+)\t(?<transend>[0-9]+)\t(?<type>\w+)$/){
		#give every Region a specific name --> Their name consists of the located chromosome, the regionstart and regionend
		$name = "$+{chromosome}\t$+{regionstart}\t$+{regionend}";  
		
		#every further transposon is pushed in an array as a hashref
		if (exists $regions{$name}){
			my @array = @{$regions{$name}};
			push (@array,{transstart => $+{transstart}, transend => $+{transend}, type => $+{type}});
			$regions{$name} =[@array]; #returns a array reference full of hash references
			next;
		}
		#first transposon
		else {
			$regions{$name} = [{transstart => $+{transstart}, transend => $+{transend}, type => $+{type}}]; #arrayref with a hashref for the first transposon 
		}
	}
	#matches every region without a transposon
	elsif (/^(?<chromosome>chr(.)+)\t(?<regionstart>[0-9]+)\t(?<regionend>[0-9]+)\t.\t(?<transstart>-1)\t(?<transend>-1)\t(?<type>)$/){
		$name = "$+{chromosome}\t$+{regionstart}\t$+{regionend}"; #give every Region a specific name
		$regions{$name} = {"LTR"=> 0,"DNA"=> 0,"LINE"=> 0,"SINE"=> 0}; #no transposons --> no overlaps --> save it in a hashref
	}
	else{
		warn "The line $_ has not the right format!\n";
	}
}

close (READ);

my $oldtransstart;
my $i;
my $oldtype;
my @sortedTransposons;

# this foreach loop sorts all the overlapping transposons of a region and checks if there are any overlaps in the transposons of a specific type
foreach (keys %regions){
	$name = $_;
	my @newarray = ();
	
	$i = 0; #index = 0 means a new Region started
	
	if (ref($regions{$name}) =~ /^ARRAY$/){
		my @transposons = @{$regions{$_}}; #dereference 
		@sortedTransposons = sort {$b->{type} cmp $a->{type} or $b->{transend} <=> $a->{transend} or $b->{trannsstart} <=> $a->{transstart}} @transposons; #sorts according to the type, the end of the Transposonregion or the Transposonstart descending
	
		foreach (@sortedTransposons){
			if ($i == 0){ # this is the first transposon of a region
				$oldtransstart = $_->{transstart}; #save the transposon start
				$oldtype = $_->{type}; #saves the transposontype 
				$i=1; #-->skips this if clause next time
				next;
			}
			
			#index greater than zero + oldtype equals the type of the other transposon --> Transposons of the same type
			elsif ($i==1 and $_->{type} eq $oldtype){ 
				
				#if the transposon regions of this type overlap
				if ($_->{transend} >= $oldtransstart){ 
					#change the transposonend to the transstart of the previous Transposon --> non-overlapping
					$_->{transend} = $oldtransstart-1; 
				
					#checks if the changed Transposonend is now smaller than the Transposonend, if so change the start to the end --> length 0
					if ($_->{transend} < $_->{transstart}){ 
						$_->{transstart} = $_->{transend};
						$oldtransstart = $_->{transstart};
					}                                              
					next;													
				}                                                            
			}
			#if the type did not match --> change the oldtransstart and oldtype scalar
			elsif($i==1 and $_->{type} ne $oldtype){
				$oldtransstart = $_->{transstart};
				$oldtype = $_->{type};
				next;
			}
		}
		#to get the overlap percentage we need the start and the end of the region(which is in the name) as well as the overlapping transposons
		$regions{$name} = getoverlaps($name,\@sortedTransposons); 
			
	}	

	elsif (ref($regions{$name}) =~ /^HASH$/){ #if its a hash --> This region has no overlapping transposons --> do nothing
		next;
	}
	else{
		warn "Error in the line: $_\n";
	}
}

#Write the calculated overlaps for each region in a new file
open (WRITE, ">$ARGV[0].$0.txt") or die "Cannot write in this file: >$ARGV[0].$0.txt\n";
foreach (keys %regions){
	my $region = $_; #name of the region. with all tabs in it --> ready to print
	my $deref = $regions{$_}; #give the specific region a name to dereference it 
	my %deref = %$deref; #dereference the type with their overlaps
	foreach (keys %deref){
		print WRITE $region,"\t";	#prints the region
		printf WRITE ("%.2f", $deref{$_}*100); #number with 2 decimals
		print WRITE "%\t",$_,"\n"; #number in percent and printing of the type
	}
}
close WRITE;


#this soubroutine calculates the overlaps for each individual transposon type
#and returns a hash reference with the types and the overlap percentage
sub getoverlaps{
	
	my %overlaps; # a hash for the overlap percentage of the different types
	
	my $Regionname = $_[0]; #the name looks like this "$+{chromosome}\t$+{regionstart}\t$+{regionend}"
	my @subsortedTransposons = @{$_[1]};
	
	my @Region = split ("\t",$Regionname); #split to get the Regionstart and Regionend
	my $Regionstart = $Region[1]; #Regionstart is the second Element in the array
	my $Regionend = $Region[2]; #Regionend is the third Element in the array
	my $Regionlength = $Regionend - $Regionstart; #calculate the Regionlength to be able to calculate the overlap later
	
	$overlaps{$Regionname} = {"LTR"=> 0,"DNA"=> 0,"LINE"=> 0,"SINE"=> 0}; #Every region starts with 0% overlap
	
	my $oldoverlap=0;
	my $newoverlap;
	my $type;
	my $overlaplength;
	my $overlap; 
	
	
	foreach (@subsortedTransposons){
		if ($Regionlength == 0){ 
			warn "A Region cannot have the length 0!\n";
			last; # this cannot be a Region--> stop the foreach loop
		}
		if ($_->{transstart} >= $Regionstart and $_->{transend}<=$Regionend){ #whole transposon is in the region
			$overlaplength = $_->{transend}-$_->{transstart}; #-->the overlaplength = transposonend - transposonstart
			$overlap = $overlaplength/$Regionlength; #overlap percentage of the transposon and the region
			$type = $_->{type}; #get the type of the transposon
			$oldoverlap = $overlaps{$Regionname}->{$type}; #overlap percentage of this type before this transposon
			$newoverlap = $oldoverlap+$overlap; #add the calculated overlap percentage of this transposon to the old one
			$overlaps{$Regionname}->{$type} = $newoverlap; 
			next;
		}
		elsif ($_->{transstart} >= $Regionstart and $_->{transend} >= $Regionend){ #start of the transposon is in the region
			$overlaplength = $Regionend - $_->{transstart}; #--> overlap length = Regionend - Transstart
			$overlap = $overlaplength/$Regionlength; 
			$type = $_->{type};
			$oldoverlap = $overlaps{$Regionname}->{$type};
			$newoverlap = $oldoverlap+$overlap;
			$overlaps{$Regionname}->{$type} = $newoverlap;
			next;
		}
		elsif ($_->{transstart} <= $Regionstart and $_->{transend} <= $Regionend){ #end of the transposon is in the region
			$overlaplength = $_->{transend}-$Regionstart; #-->  overlap length = Transend - Regionstart
			$overlap = $overlaplength/$Regionlength; 
			$type = $_->{type};
			$oldoverlap = $overlaps{$Regionname}->{$type};
			$newoverlap = $oldoverlap+$overlap;
			$overlaps{$Regionname}->{$type} = $newoverlap;
			next;
		}
		elsif($_->{transstart} < $Regionstart and $_->{transend} >	$Regionend){ #the transposon is bigger than the region
			$overlaplength = $Regionend-$Regionstart; #--> overlap length = Regionend - Regionstart
			$overlap = $overlaplength/$Regionlength; 
			$type = $_->{type};
			$oldoverlap = $overlaps{$Regionname}->{$type};
			$newoverlap = $oldoverlap+$overlap;
			$overlaps{$Regionname}->{$type} = $newoverlap;
			next;		
		}
		else{
			warn "Something was wrong in the subroutine getoverlaps in the line ",%$_,"!\n";
		}
	}
	return ($overlaps{$Regionname});
}

#¯\_(ツ)_/¯	





		