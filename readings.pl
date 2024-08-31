use strict;
use 5.10.0;
while(<>){
	chomp;
	next unless s/.*[|]\s*//;
	say;
}
