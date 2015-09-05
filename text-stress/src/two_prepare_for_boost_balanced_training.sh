src_dir=`dirname $0`
cd $src_dir
cd ../
WORKDIR=`pwd`


mkdir -p $WORKDIR/data/2-prepare-boost-format
CURDIR=$WORKDIR/data/2-prepare-boost-format

sed 's/,\ /\ <comma>\ /g' $WORKDIR/data/1-pure-format-list/pure > $WORKDIR/data/2-prepare-boost-format/pure.comma

sed -i 's/,,/,/g' $WORKDIR/data/2-prepare-boost-format/pure.comma 

sed -i 's/,[^ns]/\ <comma>\ /g' $WORKDIR/data/2-prepare-boost-format/pure.comma 

head -200 $CURDIR/pure.comma > $CURDIR/pure.comma.test.unbalanced

sed '1,200d' $CURDIR/pure.comma > $CURDIR/pure.comma.unbanlance.training

sed '1,100{/,nostress/d}' $CURDIR/pure.comma.test.unbalanced > $CURDIR/pure.comma.test

sed '1,500{/,nostress/d}' $CURDIR/pure.comma.unbanlance.training > $CURDIR/pure.comma.data

echo 'stress,nostress.
feature: text.' > $CURDIR/pure.comma.names

 
