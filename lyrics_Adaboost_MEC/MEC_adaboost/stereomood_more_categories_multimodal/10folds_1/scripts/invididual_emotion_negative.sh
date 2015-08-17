WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file

sort $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.data > $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.data.sorted
sort $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.test > $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.test.sorted

for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
# create the data negative file
sort $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i} > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i}.sorted
comm -13 $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i}.sorted $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.data.sorted > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.not${i}
num=`wc $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i}.sorted | awk '{print $1}'`
head -n $num $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.not${i} > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.not${i}.head${num}
# cp the data file to the binary directory
cp $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.not${i}.head${num} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/.

# create the test file
sort $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i} > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i}.sorted
comm -13 $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i}.sorted $WORKDIR/stereomood_more_categories_multimodal/stereomood_more_categories_multimodal_10folds.test.sorted > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.not${i}
num=`wc $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i}.sorted | awk '{print $1}'`
head -n $num $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.not${i} > $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.not${i}.head${num}
# cp the test data to the test file
cp  $WORKDIR/stereomood_more_categories_multimodal/individual_emotion/stereomood_more_categories_multimodal_10folds.test.not${i}.head${num} $WORKDIR/stereomood_more_categories_multimodal_binary/${i}/lyrics/.

done

