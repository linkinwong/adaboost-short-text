WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file
for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
#mkdir $WORKDIR/stereomood_more_categories_multimodal_binary/${i}
cp $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/.
cp $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/.
done

