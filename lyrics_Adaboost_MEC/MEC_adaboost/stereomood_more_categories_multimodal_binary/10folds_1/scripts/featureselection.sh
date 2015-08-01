WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary/

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
for j in marsyas opensmile
do
cd /home/sudan/program/weka-3-6-4/
java weka.filters.supervised.attribute.AttributeSelection -E "weka.attributeSelection.FilteredSubsetEval -W \"weka.attributeSelection.CfsSubsetEval \" -F \"weka.filters.supervised.instance.SpreadSubsample -M 0.0 -X 0.0 -S 1\"" -S "weka.attributeSelection.GreedyStepwise -T -1.7976931348623157E308 -N -1" -b -i $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_train_${j}.arff -o $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_train_${j}_filteredSubsetEval.arff -r $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_${j}.arff -s $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_${j}_filteredSubsetEval.arff
done
done


