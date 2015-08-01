WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
cd /home/sudan/program/weka-3-6-4/
for j in train test
do
java weka.filters.unsupervised.attribute.Remove -R last -i $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval.arff -o $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_nooutput.arff

java weka.core.Instances merge $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_nooutput.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_psysound.arff > $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_psysound.arff

java weka.filters.unsupervised.attribute.Remove -R last -i $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_psysound.arff -o $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_psysound_nooutput.arff

java weka.core.Instances merge $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_psysound_nooutput.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_opensmile_filteredSubsetEval.arff > $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_${j}_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval.arff 
done
done
