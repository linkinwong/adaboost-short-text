
src_dir=`dirname $0`
cd $src_dir
WORKDIR=`pwd`


python $WORKDIR/one_create_pure_sentence_label.py
bash $WORKDIR/two_prepare_for_boost_balanced_training.sh
bash $WORKDIR/three_icsiboost.sh
