WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
perl $WORKDIR/scripts/calculate_statistical_results.pl $WORKDIR/${i}/audio/prediction/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval.pred $WORKDIR/statistical/${i}_not${i}_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval
done
