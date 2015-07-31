WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

scripts_dir=`dirname $0`
cd $scripts_dir
scripts_dir=`pwd`
cd ../
WORKDIR=`pwd`

#for j in 2 3 4 5 6 7 8 9 10
for j in 1
do
for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
# create the data file
sed -i "s/,.*$/,not${i}/g" $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.data.not${i}.head*
cat $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.data.${i} $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.data.not${i}.head* > $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}_${i}.data
# create the test file
sed -i "s/,.*$/,not${i}/g" $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.test.not${i}.head*
cat $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.test.${i} $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}.test.not${i}.head* > $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}_${i}.test
# create the names file
cp $WORKDIR/10folds_${j}/stereomood_more_categories_multimodal_10folds.names $WORKDIR/10folds_${j}/${i}/lyrics/.

mv $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds.names $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}_${i}.names
sed -i "s/emotion/${i}/g" $WORKDIR/10folds_${j}/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${j}_${i}.names
done
done




