WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

scripts_dir=`dirname $0`
cd $scripts_dir
scripts_dir=`pwd`
cd ../
WORKDIR=`pwd`

for j in 1 2 3 4 5 6 7 8 9 10
do
for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
# find the minimum error rate and its iteration
awk 'min=="" || $10 < min {min=$10; miniter=$2}; END{ print "'${i}'""\t"miniter"\t"min}' $WORKDIR/10folds_${j}/${i}/lyrics/result/default_stereomood_more_categories_multimodal_10folds_${j}_${i} >> $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_default
awk 'min=="" || $10 < min {min=$10; miniter=$2}; END{ print "'${i}'""\t"miniter"\t"min}' $WORKDIR/10folds_${j}/${i}/lyrics/result/ngram_2_stereomood_more_categories_multimodal_10folds_${j}_${i} >> $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_2
awk 'min=="" || $10 < min {min=$10; miniter=$2}; END{ print "'${i}'""\t"miniter"\t"min}' $WORKDIR/10folds_${j}/${i}/lyrics/result/ngram_3_stereomood_more_categories_multimodal_10folds_${j}_${i} >> $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_3
done
done

