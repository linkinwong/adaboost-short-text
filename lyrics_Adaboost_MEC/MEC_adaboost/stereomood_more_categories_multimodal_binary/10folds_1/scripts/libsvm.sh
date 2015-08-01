WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
for j in marsyas opensmile psysound
do
cd /home/sudan/program/weka-3-6-4/
java -Xmx1024m -classpath weka.jar:libsvm.jar weka.classifiers.functions.LibSVM -t  $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_train_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval.arff -T  $WORKDIR/${i}/audio/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval.arff -distribution -K 0 -Z -B -p last -no-cv -c last > $WORKDIR/${i}/audio/prediction/stereomood_more_categories_multimodal_10folds_${i}_not${i}_test_marsyas_filteredSubsetEval_psysound_opensmile_filteredSubsetEval.pred
done
done
