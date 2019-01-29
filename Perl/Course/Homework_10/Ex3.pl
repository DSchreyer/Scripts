#! \usr\bin\perl
use strict;
use warnings;

my @coords = (
{"gene" => "ABO",
"chr" => "chr9",
"coordinates" => [133255602 , 133275214] ,
"strand" => "-"
},
{"gene" => "SURF6",
"chr" => "chr9",
"coordinates" => [133328774 , 133336398 ],
"strand" => "forward"
} );

my %hash;
my $ref;
my @array;
my @ref;
my $gene = "";

foreach (@coords){
	$ref = ref($_);
	%hash = %$_;
	
	if ($ref =~ /HASH/){
		%hash = %$_;
	}
	$gene = $hash{"gene"};
	foreach (%hash){
		$ref = ref($_);
		print $ref;
		if ($ref =~ /ARRAY/){
			@ref = @$_;
			if ($gene =~/SURF6/){
				push (@ref,133331806,133332939);
			}
			push (@array,@ref);
		}
	}

	if ($hash{"strand"}=~ s/forward/+/){}
	print $hash{"gene"},": ",$hash{"chr"},":",@array,$hash{"strand"},"\n";	
	@ref = "";
}
