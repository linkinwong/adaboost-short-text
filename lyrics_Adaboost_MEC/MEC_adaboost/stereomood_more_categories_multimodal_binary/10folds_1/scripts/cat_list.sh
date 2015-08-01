WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
cd $WORKDIR
cat $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.data.${i}.list $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.data.not${i}.head.list > $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.data.${i}_not${i}.list
cat $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.test.${i}.list $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.test.not${i}.head.list > $WORKDIR/stereomood_more_categories_multimodal_binary/list/stereomood_more_categories_multimodal_10folds.test.${i}_not${i}.list
done
