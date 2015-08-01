WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
for j in marsyas opensmile psysound
do
cd /home/sudan/program/weka-3-6-4/
java weka.core.Instances append $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_train_${j}.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_train_${j}.arff > $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_train_${j}.arff

java weka.core.Instances append $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_test_${j}.arff $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_not${i}_test_${j}.arff > $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_${j}.arff
done
done
