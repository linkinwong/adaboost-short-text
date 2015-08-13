#!/bin/bash

WORKDIR=/media/1Tnewdisk/intention_routing/icsiboost_file/stereomood_more_categories_multimodal_binary

file_abs_path=`readlink -f $0`
script_dir=`dirname ${file_abs_path}`
WORKDIR=`dirname $script_dir`
echo $WORKDIR

func () {
#for j in 1 2 3 4 5 6 7 8 9 10
for j in 1 
do
for i in groovy 
do
cut -f2 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_default > $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_default.iteration_num
sed -i 's/://g' $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_default.iteration_num

cut -f2 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_2 > $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_2.iteration_num
sed -i 's/://g' $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_2.iteration_num

cut -f2 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_3 > $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_3.iteration_num
sed -i 's/://g' $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_3.iteration_num


done
done
}

# retrain the icsiboost file using the iteration number
#for j in 1 2 3 4 5 6 7 8 9 10
for j in 3
do
#emotion=(sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm)
emotion=(sad high groovy) 
i=0

for k in `head -3 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_default.iteration_num`
do
emotion_current=${emotion[$i]}
echo $emotion_current
cd $WORKDIR/10folds_${j}/${emotion_current}/lyrics/

icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} -n $k --model model/default_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k > result/default_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k
# do the prediction


icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} --model model/default_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k -C -o < stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}.test.nolabel > predictions/default_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k
i=`expr $i + 1`
done

i=0
for k in `head -3 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_2.iteration_num`
do
emotion_current=${emotion[$i]}
cd $WORKDIR/10folds_${j}/${emotion_current}/lyrics/
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} -n $k -N ngram -W 2 --model model/ngram_2_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k > result/ngram_2_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k

icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} -N ngram -W 2 --model model/ngram_2_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k -C --posteriors < stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}.test.nolabel > predictions/ngram_2_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k

i=`expr $i + 1`
done

i=0
for k in `head -3 $WORKDIR/result_icsiboost/10folds_${j}_icsiboost_ngram_3.iteration_num`
do
emotion_current=${emotion[$i]}
cd $WORKDIR/10folds_${j}/${emotion_current}/lyrics/
icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} -n $k -N ngram -W 3 --model model/ngram_3_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k > result/ngram_3_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k

icsiboost -S stereomood_more_categories_multimodal_10folds_${j}_${emotion_current} --model model/ngram_3_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k -N ngram -W 3 -C --max-fmeasure ${emotion_current} < stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}.test.nolabel > predictions/ngram_3_stereomood_more_categories_multimodal_10folds_${j}_${emotion_current}_$k

i=`expr $i + 1`


done

done


