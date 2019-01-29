use strict;
use warnings;
use LWP::UserAgent ();

my $ua = LWP::UserAgent->new;
$ua->timeout(10);
$ua->env_proxy;

my $response = $ua->get('https://www.ncbi.nlm.nih.gov/genbank/statistics/');

print "Type in a Release Date (ex. Dec 2012): ";
my $answer = <STDIN>;
chomp $answer;

my $decoded;
if ($response->is_success) {

	if ($response->decoded_content =~  /\[\"([0-9.]+)\"\,\s\"($answer)\",\s\"([0-9]+)\",\s\"([0-9]+)\",\s\"([0-9]*)\",\s\"([0-9]*)\"\]/g){
		print "$answer: Bases $3, Sequences $4 !\n";
	}
	else { die "This is not a release date!\n";}
}
else {
	die $response->status_line;
}


#works for all Dates
