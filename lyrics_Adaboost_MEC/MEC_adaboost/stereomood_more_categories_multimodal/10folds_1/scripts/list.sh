WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal
for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
# for the positive instances list
perl $WORKDIR/scripts/wavlist_production_icsiboost.pl $WORKDIR/stereomood_more_categories_multimodal_10folds.data $WORKDIR/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i} $WORKDIR/stereomood_more_categories_multimodal_text_10folds_train.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.data.${i}.list
perl $WORKDIR/scripts/wavlist_production_icsiboost.pl $WORKDIR/stereomood_more_categories_multimodal_10folds.test $WORKDIR/individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i} $WORKDIR/stereomood_more_categories_multimodal_text_10folds_test.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.test.${i}.list
# for the negative instances list
perl $WORKDIR/scripts/wavlist_production_icsiboost.pl $WORKDIR/stereomood_more_categories_multimodal_10folds.data $WORKDIR/individual_emotion/stereomood_more_categories_multimodal_10folds.data.not${i}.head* $WORKDIR/stereomood_more_categories_multimodal_text_10folds_train.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.data.not${i}.head.list
perl $WORKDIR/scripts/wavlist_production_icsiboost.pl $WORKDIR/stereomood_more_categories_multimodal_10folds.test $WORKDIR/individual_emotion/stereomood_more_categories_multimodal_10folds.test.not${i}.head* $WORKDIR/stereomood_more_categories_multimodal_text_10folds_test.list $WORKDIR/list/stereomood_more_categories_multimodal_10folds.test.not${i}.head.list
done


