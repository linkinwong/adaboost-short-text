#!/usr/bin/perl
use warnings;
use strict;
use Switch;

################################################################3
##
#   This script is to form an subset arff from an reference arff, which includes all the wavfiles's feature
#	Author: Su Dan
#	Last Modified:	2012-3-15
###############################################################
# this is the mf file that produce the arff file
my $input_all_wav_list = shift @ARGV;
chomp $input_all_wav_list;

my $input_subset_wav_list = shift @ARGV;
chomp $input_subset_wav_list;

my $input_arff = shift @ARGV;
chomp $input_arff;

my $output_arff = shift @ARGV;
chomp $output_arff;

my $emotion_label = shift @ARGV;
chomp $emotion_label;

open FpIn1, "$input_all_wav_list" or die "Can not open $input_all_wav_list to read $! \n";
open FpIn2, "$input_subset_wav_list" or die "Can not open $input_subset_wav_list to read $! \n";
open FpIn3, "$input_arff" or die "Can not open $input_arff to read $! \n";
open FpOut, ">$output_arff" or die "Can not open $output_arff to write $! \n";

my $inline1 = "";
my $inline2 = "";
my $inline3 = "";
my %feature;
my @temp = ();
my $label="";
my $key="";
my $default="";

while($inline1 = <FpIn3>)
{
	chomp $inline1;
	print FpOut "$inline1\n";
	if($inline1 =~ m/\@data/)
	{	
		$inline1 = <FpIn3>;
		chomp $inline1;
		#while($inline1 eq "")
		#{
		#$inline1 = <FpIn3>;
		#chomp $inline1;
		#}
		# begin to read the features
		

	# since certain files that might appeared in multiple emotion categories, even though the vaule is the same but the label will be different
	# we want to the exact labels
		@temp = split(/\,/, $inline1);
		$label = $temp[-1];
		
		while($inline2 = <FpIn1>)
		{
		chomp $inline2;
		#$key = $inline2."_$label";
		$key=$inline2;
		#print "$key=======================\n";
		#@temp = split(/\//, $inline2);
		$feature{$key} = $inline1;
		$inline1 = <FpIn3>;
		chomp $inline1;
		@temp = split(/\,/, $inline1);
		$label = $temp[-1];
		
		}
	
	}#if

}

while($inline3 = <FpIn2>)
{
	chomp $inline3;
	#print "$inline3\n";
	
	$inline3 =~ s/.lyrics.txt//g;
	#$key = $inline3."_$emotion_label";
	$key=$inline3;
	#print "$key=======================\n";
	if(exists $feature{$key})
	{

	$default=$feature{$key};
	$default=~ s/,[a-z]+/,${emotion_label}/g;	
	#print "$default====\n";
	print FpOut "$default\n";
	}
	else
	{
	print FpOut "$default\n";
	}
}



close(FpIn1);
close(FpIn2);
close(FpIn3);
close(FpOut);
