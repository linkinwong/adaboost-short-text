#!/usr/bin/perl
use warnings;
use strict;
use Switch;
use List::Util qw(sum);

###############################################################333
#	When we do testing (prediction), we supposed do not have
#	the label information of each instance, so weka will not
#	output the statistical information of the testing datasets.
#	So we need to calculate that kind of information from the
#	the prediction of weke. including the Precision, Recall, Fmeasure, Acc
#	especially for the positive instances
#	
#	Author: Su Dan
#	Date: 2012-04-02
#	Usage:
#############################################################

my $input_pred = shift @ARGV;
chomp @ARGV;


my $output_statistical = shift @ARGV;
chomp @ARGV;

open FpIn, "$input_pred" or die "Can not open $input_pred to read $! \n";
open FpOut, ">$output_statistical" or die "Can not create $output_statistical to write $! \n";

my $inline = "";
my @temp;
my @temp1;
my @temp2;
my $actual_label = "";
my $predicted_label = "";
my @confusion_matrix;
my $precision = "";
my $recall = "";
my $fmeasure = "";
my $acc = "";



# parse the prediciton results
#inst#     actual  predicted error distribution ()
 #    1    1:angry    1:angry       *0.956,0.044 

#
@confusion_matrix = ([0,0],[0,0]);
while($inline = <FpIn>)
{
	chomp $inline;
	if($inline =~ /distribution/)
	{
	while($inline = <FpIn>)
	{
	chomp $inline;
	if(($inline ne "") && !eof)
	{
	@temp = split(/\s+/, $inline);
	$actual_label = $temp[2];
	$predicted_label = $temp[3];
	@temp1 = split(/:/, $actual_label);
	@temp2 = split(/:/, $predicted_label);
	$actual_label = $temp1[0];
	$predicted_label = $temp2[0];
	# calculate the confusion matrix
	#print "$actual_label\t$predicted_label\n";
	if($actual_label == 1)
	{
		if($predicted_label == 1)
		{
			${$confusion_matrix[0]}[0]++;	
		}
		elsif($predicted_label == 2)
		{	
			${$confusion_matrix[0]}[1]++;
		}
	} # if
	elsif($actual_label == 2)
	{
		if($predicted_label == 1)
		{
			${$confusion_matrix[1]}[0]++;	
		}
		elsif ($predicted_label == 2)
		{	
			${$confusion_matrix[1]}[1]++;
		}

	} # elseif
	
	} # if
	}#while
	}#if
	
} 
close(FpIn);
#print "@{$confusion_matrix[0]}\n@{$confusion_matrix[1]}\n";
# calculate the statistical from the confusion matrix
# we only calculate the results of the positive instances
# it is possiable that the predicted values are 0.
if($confusion_matrix[0][0]==0)
{
$precision = 0;
$recall = 0;
$fmeasure = 0;
}
else
{
$precision = $confusion_matrix[0][0]/($confusion_matrix[0][0]+$confusion_matrix[1][0]);
$recall = $confusion_matrix[0][0]/($confusion_matrix[0][0]+$confusion_matrix[0][1]);
$fmeasure = 2*$precision*$recall/($precision + $recall);
}
$acc = ($confusion_matrix[0][0] + $confusion_matrix[1][1])/($confusion_matrix[0][0]+$confusion_matrix[0][1]+$confusion_matrix[1][0]+$confusion_matrix[1][1]);

print FpOut "=====Evaluation on the test set======\n\n";
print FpOut "=======Summary on the postive instances=======\n\n";

print FpOut "Acc:\t$acc\n";
print FpOut "Precision\t$precision\n";
print FpOut "Recall\t$recall\n";
print FpOut "Fmeasure\t$fmeasure\n";
print FpOut "=====Confusion Matrix======\n";
print FpOut "a\tb\t<-Classified as\n";
print FpOut "$confusion_matrix[0][0]\t$confusion_matrix[0][1]\n";
print FpOut "$confusion_matrix[1][0]\t$confusion_matrix[1][1]\n";


close(FpOut);





