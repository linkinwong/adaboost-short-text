WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
cd $WORKDIR
# create the names file
cp $WORKDIR/stereomood_more_categories_multimodal_10folds.names $WORKDIR/${i}/lyrics/.

mv $WORKDIR/${i}/lyrics/stereomood_more_categories_multimodal_10folds.names $WORKDIR/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.names
sed -i "s/emotion/${i}/g" $WORKDIR/${i}/lyrics/stereomood_more_categories_multimodal_10folds_${i}.names

cd $WORKDIR/${i}/lyrics
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 > result/default_stereomood_more_categories_multimodal_10folds_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 -N ngram -W 2 > result/ngram_2_stereomood_more_categories_multimodal_10folds_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${i} -n 1000 -N ngram -W 3 > result/ngram_3_stereomood_more_categories_multimodal_10folds_${i}
done
