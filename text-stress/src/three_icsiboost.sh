
src_dir=`dirname $0`
cd $src_dir
cd ../
WORKDIR=`pwd`


mkdir -p $WORKDIR/data/3-icsiboost-result
CURDIR=$WORKDIR/data/3-icsiboost-result
PREDIR=$WORKDIR/data/2-prepare-boost-format
mkdir -p $CURDIR/prediction


cd $WORKDIR/data/2-prepare-boost-format
icsiboost -S pure.comma -n 1000  -E 0.5 -V --jobs 5 > ${CURDIR}/default_smoothing_0.5_pure.comma
cp $PREDIR/pure.comma.shyp $CURDIR/pure.comma.default.shyp

icsiboost -S pure.comma -n 1000 -N ngram -W 2 -E 0.5 --posteriors --jobs 5 > ${CURDIR}/ngram_2_smoothing_0.5_pure.comma
cp $PREDIR/pure.comma.shyp $CURDIR/pure.comma.bigram.shyp


icsiboost -S pure.comma -n 1000  -E 0.5 --model $CURDIR/pure.comma.default.shyp -C -o < $PREDIR/pure.comma.test > ${CURDIR}/prediction/default_smoothing_0.5_pure.comma

icsiboost -S pure.comma -n 1000 -N ngram -W 2 -E 0.5 --model $CURDIR/pure.comma.bigram.shyp -o -C < $PREDIR/pure.comma.test > ${CURDIR}/prediction/ngram_2_smoothing_0.5_pure.comma


