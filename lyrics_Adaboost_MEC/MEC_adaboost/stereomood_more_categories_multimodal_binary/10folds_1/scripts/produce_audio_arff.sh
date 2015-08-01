WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
for j in marsyas opensmile psysound
do
# since we need to provide the labels we should produce the positive and negative instance separately
perl $WORKDIR/scripts/select_feature_of_wav_subset.pl $WORKDIR/withlabel.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.data.${i}.list $WORKDIR/${j}_withlabel.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_train_${j}.arff ${i}
perl $WORKDIR/scripts/select_feature_of_wav_subset.pl $WORKDIR/withlabel.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.data.not${i}.head.list $WORKDIR/${j}_withlabel.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_train_${j}.arff not${i}

sed -i "s/\@attribute output {.*}/\@attribute output {${i},not${i}}/g" $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_train_${j}.arff
sed -i "s/\@attribute output {.*}/\@attribute output {${i},not${i}}/g" $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_train_${j}.arff

# for the test data
perl $WORKDIR/scripts/select_feature_of_wav_subset.pl $WORKDIR/withlabel.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.test.${i}.list $WORKDIR/${j}_withlabel.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_test_${j}.arff ${i}
perl $WORKDIR/scripts/select_feature_of_wav_subset.pl $WORKDIR/withlabel.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.test.not${i}.head.list $WORKDIR/${j}_withlabel.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_test_${j}.arff not${i}
sed -i "s/\@attribute output {.*}/\@attribute output {${i},not${i}}/g" $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_test_${j}.arff
sed -i "s/\@attribute output {.*}/\@attribute output {${i},not${i}}/g" $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_test_${j}.arff

done
done


