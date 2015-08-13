func () {
scripts_dir=`dirname $0`
cd $scripts_dir
scripts_dir=`pwd`
cd ../
WORKDIR=`pwd`
}

file_location=`readlink -f $0`
scripts_dir=`dirname $file_location`
WORKDIR=`dirname $scripts_dir`
echo $WORKDIR

#for j in 1 2 3 4 5 6 7 8 9 10
for j in 1
do
#for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
#for i in angry jazzy
for i in groovy
do

cd $WORKDIR/10folds_${j}/${i}

new_dir=result-icsiboost-function-4

mkdir $new_dir

cd $WORKDIR/10folds_${j}/${i}/lyrics/
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -E 0.5 -V --jobs 5 > ../${new_dir}/default_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}
mv stereomood_more_categories_multimodal_10folds_${j}_${i}.shyp  stereomood_more_categories_multimodal_10folds_${j}_${i}.default.shyp

icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -N ngram -W 2 -E 0.5 --posteriors --jobs 5 > ../${new_dir}/ngram_2_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}

mv stereomood_more_categories_multimodal_10folds_${j}_${i}.shyp  stereomood_more_categories_multimodal_10folds_${j}_${i}.bigram.shyp

icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${i} -n 1000 -N ngram -W 3 -E 0.5 --optimal-iterations --jobs 5 > ../${new_dir}/ngram_3_smoothing_0.5_stereomood_more_categories_multimodal_10folds_${j}_${i}

mv stereomood_more_categories_multimodal_10folds_${j}_${i}.shyp  stereomood_more_categories_multimodal_10folds_${j}_${i}.trigram.shyp

done
done
