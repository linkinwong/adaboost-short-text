WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
cd $WORKDIR
# create the data file
sed -i "s/,.*$/,not${i}/g" $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.data.not${i}.head*
cat $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.data.${i} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.data.not${i}.head* > $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.data
# create the test file
sed -i "s/,.*$/,not${i}/g" $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.test.not${i}.head*
cat $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.test.${i} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.test.not${i}.head* > $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.test
# create the names file
cp $WORKDIR/stereomood_more_categories_multimodal_binary/stereomood_more_categories_multimodal_10folds.names $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/.

mv $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds.names $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.names
sed -i "s/emotion/${i}/g" $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.names

cd $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 > result/default_stereomood_more_categories_multimodal_10folds_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 -N ngram -W 2 > result/ngram_2_stereomood_more_categories_multimodal_10folds_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 -N ngram -W 3 > result/ngram_3_stereomood_more_categories_multimodal_10folds_${i}
done
