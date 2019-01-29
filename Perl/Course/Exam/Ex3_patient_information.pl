#! /usr/bin/perl
use strict;
use warnings;

my $CSV_file = "$ARGV[0]"; #csv file in the command line argument
my $XML_file = "$ARGV[1]"; #XML file to write in 

if ($CSV_file !~ /^.+\.csv$/){ #if it's not a csv file --> die
	die "The entered file is not a csv file!\n";
}
if ($XML_file !~ /^.+\.xml$/){ #if it's not a xml file --> die
	die "The entered file is not a xml file!\n";
}

open (READ, $CSV_file)||die "Failed to open $CSV_file!\n";
my @csv_data = <READ>; #stores the file in @csv_data
chomp @csv_data; #removes the newline characters of each line ends --> tested on linux --> chomp does not work -> error with the melder id, but does work on windows --> no idea why not
close READ;

my @header = split (",",$csv_data[0]); #Komma seperates each information. store each information as an element in this array

shift(@csv_data); #removes the header from the file

my %HeaderIndices; #a hash to store the header in keys and the indices in values

my $index = 0;
foreach (@header){ #this foreach loop gives every header a index
	$HeaderIndices{$_} = $index;
	$index++;
}
 
open (WRITE, ">$XML_file") or die "Cannot open $XML_file!\n";	#open file to write in
print WRITE "<?xml version=\"1.0\"?>\n"; 
print WRITE "<ADT_GEKID>\n";
print WRITE " <Menge_Patient>\n";

my $PatientenID=1; #The first Patient has the PatientenID 1

foreach (@csv_data){ #every line is a new patient
	
	my @Patient = split (",",$_); #stores every information about a patient in this array -- informations are also split by kommas
	
	my $KrankenkassenNr = $Patient[$HeaderIndices{"KrankenkassenNr"}]; #gets the information by getting the index of the hash 
	my $Patienten_Nachname = $Patient[$HeaderIndices{"Patienten_Nachname"}]; #stores every information about a patient
	my $Patienten_Vornamen = $Patient[$HeaderIndices{"Patienten_Vornamen"}];
	my $Patienten_Geburtsname = $Patient[$HeaderIndices{"Patienten_Geburtsname"}];
	my $Patienten_Titel = $Patient[$HeaderIndices{"Patienten_Titel"}];
	my $Patienten_Geschlecht = $Patient[$HeaderIndices{"Patienten_Geschlecht"}];
	my $Patienten_Geburtsdatum = $Patient[$HeaderIndices{"Patienten_Geburtsdatum"}];
	my $Patienten_Strasse = $Patient[$HeaderIndices{"Patienten_Strasse"}];
	my $Patienten_Land = $Patient[$HeaderIndices{"Patienten_Land"}];
	my $Patienten_PLZ = $Patient[$HeaderIndices{"Patienten_PLZ"}];
	my $Patienten_Ort = $Patient[$HeaderIndices{"Patienten_Ort"}];
	my $Meldedatum = $Patient[$HeaderIndices{"Datum"}];
	my $Meldeanlass = $Patient[$HeaderIndices{"Meldeanlass"}];
	my $Meldung_ID = $Patient[$HeaderIndices{"Meldung_ID"}];
	my $Melder_ID  = $Patient[$HeaderIndices{"Melder_ID"}];
	
	print "Warnings of Patient $PatientenID:\n"; #--> the user knows, which info is faulty of a specific patient
		
	my @infos = ($KrankenkassenNr,$Patienten_Nachname,$Patienten_Vornamen,$Patienten_Geburtsname,$Patienten_Titel,
				$Patienten_Geburtsdatum,$Patienten_Strasse,$Patienten_Land,$Patienten_PLZ,$Patienten_Ort,
				$Meldedatum,$Meldeanlass,$Meldung_ID,$Melder_ID); #stores every info in an array 
	
	#checks if a info is missing -->warns the user
	my $nummissinginfos = 0;
	foreach (@infos){
		$nummissinginfos = $nummissinginfos + MissingInfo($_); #if a info is missing --> +1
	}
	print "Number of missing infos: $nummissinginfos.\n"; #prints the number of missing infos
	
	#checks if the Inputs have the expected format, by calling different subroutines, which are at the end of this program
	$Patienten_Vornamen = checkPatientinfos ($Patienten_Vornamen);
	$Patienten_Nachname = checkPatientinfos ($Patienten_Nachname);
	$Patienten_Land = checkPatientinfos ($Patienten_Land);
	$Patienten_Ort = checkPatientinfos ($Patienten_Ort);
	$Patienten_Geschlecht = checkgender ($Patienten_Geschlecht);
	$Patienten_PLZ = checkPLZ($Patienten_PLZ); 
	$Meldedatum = checkDatum ($Meldedatum); 
	$Meldedatum = getMeldedatum($Meldedatum); #Meldedatum = Datum+5days
	$Meldung_ID = checkMeldungID($Meldung_ID); 
	$Melder_ID = checkMelderID($Melder_ID); 
	$Patienten_Strasse = checkStrasse($Patienten_Strasse); 
	
	#Writes in the new file --> XML Format
	print WRITE "  <Patient>\n";
	print WRITE "    <Patienten_Stammdaten Patient_ID=\"",$PatientenID,"\">\n";
	print WRITE "      <KrankenkassenNr>$KrankenkassenNr</KrankenkassenNr>\n";
	print WRITE "      <Patienten_Nachname>$Patienten_Nachname</Patienten_Nachname>\n";
	print WRITE "      <Patienten_Vornamen>$Patienten_Vornamen</Patienten_Vornamen>\n";
	print WRITE "      <Patienten_Titel>$Patienten_Titel</Patienten_Titel>\n"; #insert the Titel in the XML file aswell =/= structure example 
	print WRITE "      <Patienten_Geburtsname>$Patienten_Geburtsname</Patienten_Geburtsname>\n";
	print WRITE "      <Patienten_Geschlecht>$Patienten_Geschlecht</Patienten_Geschlecht>\n";
	print WRITE "      <Patienten_Geburtsdatum>$Patienten_Geburtsdatum</Patienten_Geburtsdatum>\n";
	print WRITE "      <Menge_Adresse>\n";
	print WRITE "        <Adresse>\n";
	print WRITE "          <Patienten_Strasse>$Patienten_Strasse</Patienten_Strasse>\n";
	print WRITE "          <Patienten_Land>$Patienten_Land</Patienten_Land>\n";
	print WRITE "          <Patienten_PLZ>$Patienten_PLZ</Patienten_PLZ>\n";
	print WRITE "          <Patienten_Ort>$Patienten_Ort</Patienten_Ort>\n";
	print WRITE "        </Adresse>\n";
	print WRITE "      </Menge_Adresse>\n";
	print WRITE "    </Patienten_Stammdaten>\n";
	print WRITE "    <Menge_Meldung>\n";
	print WRITE "      <Meldung Meldung_ID=\"",$Meldung_ID,"\" Melder_ID=\"",$Melder_ID,"\">\n";
	print WRITE "        <Meldedatum>",$Meldedatum,"</Meldedatum>\n";
	print WRITE "        <Meldeanlass>$Meldeanlass</Meldeanlass>\n";
	print WRITE "      </Meldung>\n"; #is missing in the structure example --> does not work without it --> no valid XML file. If this was not the task, please disregard this line
	print WRITE "    </Menge_Meldung>\n";
	print WRITE "  </Patient>\n";
	
	$PatientenID++; #The first Patient has the PatientenID 1, the next 2,... 
}	
print WRITE " </Menge_Patient>\n";
print WRITE "</ADT_GEKID>\n";

#checks the PLZ if it contains 5 digits
sub checkPLZ{ 
	my $PLZ = $_[0];
	
	if ($PLZ =~ /^[0-9]{5}$/ ){ #PLZ should contain only 5 digits
		return ($PLZ);
	}
	else {
		warn "The PLZ should contain 5 digits!\n";
		return ($PLZ); #returns the PLZ but gives a warning
	}
}

#checks if Vorname Nachname Ort Land contains only letters
sub checkPatientinfos{ 
	my $checkinfo = $_[0];
	if ($checkinfo =~ /^[a-zA-z]+$/){
		return ($checkinfo);
	}
	else {
		warn "$checkinfo should only contain letters!\n";
		return ($checkinfo);
	}
}

#checks if the gender is M, W or X
sub checkgender{
	my $gender = $_[0];
	if ($gender =~ /^[MWX]$/){ 
		return ($gender);
	}
	else {
		warn "$gender is not an actual gender!\n";
		return ($gender);
	}
}
	
#checks if the Datum has the right format. if not --> changes the format in European Time format
sub checkDatum{
	my $date = $_[0];
	my $day;
	my $month;
	my $year;
	
	if ($date =~ /^([0-9]{4})\.([0-9]{2})\.([0-9]{2})$/){ #check if the date is written in Canadian or Chinese date format
		$year = $1;
		$month = ($2);
		$day = ($3);
		$date = "$day.$month.$year";
		
		if (int($day) <= 31 and int($month) <= 12){	#check if the the days and months are valid --- The days are gonna get checked later in the program agani
			return ($date);
		}
		else {
			warn "$date is not a valid date!\n"; #warns and returns the date
			return ($date);
		}
	}
	elsif ($date =~ /^([0-9]{2})\.([0-9]{2})\.([0-9]{4})$/){ #Check the date format, if its American or European
		$day = $1;
		$month = $2; #--> European Format
		$year = $3;
		$date = "$day.$month.$year"; #European Format
		
		if (int($day) <= 12 and int($month) >=12 ){ #might be in American format (MMDDYYYY) 
			$day = $2;	 #\
			$month = $1; # } --> changes month and day
			$year = $3;	 #/
			$date = "$day.$month.$year"; 
		}
		if ($day <= 31 and $month <= 12){	#check if the the days and months are valid --- The days are gonna get checked later in the program again
			return ($date);
		}	
		else {
			return ($date);
			warn "$date is not a valid date!\n";
		}
		return ($date);
	}	
	else { #no match --> not a valid date, returns it anyway
		warn "$date is not a valid date!\n";
		return ($date);
	}	
}

#changes the Meldedatum to Meldedaum +5days, warns if its not a valid date, but returns the original date
sub getMeldedatum{ 
	my $subdate = $_[0]; #takes the Meldedatum and stores it in $subdate	
	my @month = qw (31 28 31 30 31 30 31 31 30 31 30 31); #days of each month
	my @monthleapyear = qw(31 29 31 30 31 30 31 31 30 31 30 31); #days of each month in a leap year
	
	if ($subdate =~ /^([0-9]{2})\.([0-9]{2})\.([0-9]{4})$/){ #checks if $subdate is in the right format
		my $subday = $1; 	#takes the day and stores it
		my $submonth = $2;	#takes the month and stores it
		my $subyear = $3;	#takes the year and stores it
		my $monthindex = $submonth;	# --> the month is now an index to call the right month in the array
		
		
		$subday = int($subday)+5; #int: day 08 -> 8,01 -> 1, Meldedatum needs to be 5 days after the Datum
		$monthindex = int($submonth) -1; #int: same as day, to get the index for the month arrays do -1
				

		
		if (($subyear%400==0 || $subyear%100!=0 ) && ($subyear%4==0)){ 	#check if the year is a leap year. Leap years are divisible by 4. if it's divisible by 100 it is not a leap year, except if it's divisible by 400
			if ($subday > $monthleapyear[$monthindex]){
				if (($subday-5) >$monthleapyear[$monthindex] ){ #this means the date was not correct in the first place
					warn "This is not a valid date!\n";
					return ($subdate);
				}
				else{ #continue with the program to get the correct Meldedatum	
				$subday = $subday - $monthleapyear[$monthindex]; #
				$submonth = $monthindex+2; #--> get the actual month
				}
			}
		}
		if ($subyear%4 != 0){ #not a leap year
			if ($subday > $month[$monthindex]){ #
				if (($subday-5) >$month[$monthindex] ){ #this means the date was not correct in the first place, same as leap year if clause
					warn "This is not a valid date!\n";
					return ($subdate);
				}
				else{
				$subday = $subday - $month[$monthindex]; 
				$submonth = $monthindex+2; #--> get the actual month
				}
			}
		}
		if ($submonth > 12){ #if the month is now greater than 12 change month and year
			$submonth = $submonth -12; 
			$subyear++;
		}
		if ($submonth =~ /^[0-9]{1}$/){
			$submonth = "0$submonth"; #change the month in the right format	
		}
		if ($subday =~ /^[0-9]{1}$/){
			$subday = "0$subday"; #change the day in the right format
		}
		
		my $newMeldedatum = "$subday.$submonth.$subyear"; #new Meldedatum needs the right format
		return ($newMeldedatum);	
	}
	else {
		warn "This is not a valid date!\n";
		return ($subdate);
	}
}

#if info is missing returns 1 --> program is able to count all the missing infos
sub MissingInfo{
	my $info = $_[0];
	if ($info eq ''){
		return (1); #returns 1 if a info is missing
	}
	else {
	return (0); #returns 0 if the info is not missing
	}
}

#checks if the street has the expected format, if not --> warns but returns it anyway
sub checkStrasse{
	my $Strasse = $_[0];
	if ($Strasse =~ /[a-zA-Z\s]+.*/){
		return ($Strasse);
	}
	else{
		warn "This is no valid street name!\n"; 
		return ($Strasse);
	}
}

#checks if the MelderID has the expected format, if not --> warn, but returns it
sub checkMelderID{
	my $subMelderID = $_[0];
	
	if ($subMelderID =~ /^ER[0-9]{6}$/ ){ #example: ER000001 --> expected Format for the MelderID
		return ($subMelderID);
	}
	else {
		warn "The Melder_ID has not the expected format!\n";
		return ($subMelderID);
	}
}

#checks if the MeldungID has the expected format. warns if the MeldungID has not the expected format, but does return it
sub checkMeldungID{
	my $subMeldungID = $_[0];
	
	if ($subMeldungID =~ /^ER[0-9]{15}$/ ){ #example: ER000001010000483 --> expected Format for the MelderID
		return ($subMeldungID);
	}
	else {
		warn "The Meldung_ID has not the expected format!\n";
		return ($subMeldungID);
	}
}

#¯\_(ツ)_/¯	