#!/ usr/ bin/ perl -w
use strict ;
use warnings ;
use Bio :: Tools :: Run :: RemoteBlast ;

my $infile = shift @ARGV ;

my $prog = " blastn ";
my $db = "nr";
my $e_val = "1e -5";
my $remoteBlast = Bio :: Tools :: Run :: RemoteBlast -> new (- prog => $prog , -data => $db , -expect =>
$e_val );

my $r = $remoteBlast -> submit_blast ( $infile );
while (my @reqIDs = $remoteBlast -> each_rid ) {
	print STDERR join (" ", "\ nINFO : RIDs : ", @reqIDs ), "\n";
	foreach my $reqID ( @reqIDs ) { # each search results
		my $rc = $remoteBlast -> retrieve_blast ( $reqID );
		if (! ref ( $rc )) {
			if ( $rc < 0) { # no match
			$remoteBlast -> remove_rid ( $reqID );
			}
		print STDERR ".";
		sleep (10) ;
		}
		else { # got some blast hit
		my $result = $rc -> next_result ; # get the blast output
		while (my $hit = $result -> next_hit ) {
		# print out the accession etc of all hits
		print $hit -> accession , "\t\t# ", $hit ->name , " ",
		$hit -> description , ", e- Val : ", $hit -> significance , "\n";
		}
		print STDERR "\ nINFO : removing $reqID \n";
		$remoteBlast -> remove_rid ( $reqID ); # remove this RID since we already
		got the results
		}
	}
}