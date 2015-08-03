
scripts_dir=`dirname $0`
cd $scripts_dir
scripts_dir=`pwd`
cd ../
WORKDIR=`pwd`

#for j in 1 2 3 4 5 6 7 8 9 10
for j in 1
do
#for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
for i in angry jazzy
do
cd $WORKDIR/10folds_${j}/${i}/lyrics/
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -E 0.5 > result/default_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -N ngram -W 2 -E 0.5 > result/ngram_2_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -N ngram -W 3 -E 0.5 > result/ngram_3_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}
done
done
