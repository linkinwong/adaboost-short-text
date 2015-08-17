#!/usr/bin/perl
use warnings;
use strict;
use Switch;
use List::Util qw(sum);

###############################################################333
#
#	This scripts is intend to produce the wavlist from the development arff file
#	and the test arff file, which was produced by weka, and we do not know the exact
#	wave files that arff represents. So we need to re-composite the procedure
#	Author: Su Dan
#	Date: 2012-03-29
#	Usage: perl scripts/wavlist_production.pl stereomood_more_categories_multimodal_text.arff stereomood_more_categories_multimodal_text_10folds_train.arff stereomood_more_categories_multimodal.list stereomood_more_categories_multimodal_10folds_train.list
#############################################################

my $input_arff_all = shift @ARGV;
chomp @ARGV;

my $input_arff_test = shift @ARGV;
chomp $input_arff_test;

my $input_wavlist_all = shift @ARGV;
chomp $input_wavlist_all;

my $output_wavlist_test = shift @ARGV;
chomp $output_wavlist_test;

open FpIn1, "$input_arff_all" or die "Can not open $input_arff_all to read $! \n";
open FpIn2, "$input_arff_test" or die "Can not open $input_arff_test to read $! \n";
open FpIn3, "$input_wavlist_all" or die "Can not open $input_wavlist_all to read $! \n";

open FpOut, ">$output_wavlist_test" or die "Can not create $output_wavlist_test to write to $!\n";

my $inline1 = "";
my $inline2 = "";
my $inline3 = "";
my @temp;
my %answer;



while(($inline1=<FpIn1>) && ($inline2=<FpIn3>))
{
	chomp $inline1;
	chomp $inline2;
	@temp = split(/\//, $inline2);
	# set the feature vector as key, and the corresponding wav file as hash value
	$answer{$inline1} = $temp[-1];
	#print "$inline1===============$temp[-1]\n";
		
		

}

while($inline3=<FpIn2>)
{
	chomp $inline3;	
	if(exists $answer{$inline3})
	{
	print "$inline3============$answer{$inline3}\n";
	print FpOut "$answer{$inline3}\n";
	}
	else {print "$inline3 does not exist===============\n";}
	
	
		
}





close(FpIn1);
close(FpIn2);
close(FpIn3);
close(FpOut);


