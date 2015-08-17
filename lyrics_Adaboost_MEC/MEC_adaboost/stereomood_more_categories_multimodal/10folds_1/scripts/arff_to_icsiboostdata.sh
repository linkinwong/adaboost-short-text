for i in stereomood_more_categories_multimodal_10folds
do
sed -i 's/\\n/. /g' ${i}.data
sed -i 's/\\r//g' ${i}.data
sed -i 's/\\//g' ${i}.data
sed -i 's/,/<comma>/g' ${i}.data
sed -i "s/^'//g" ${i}.data
sed -i "s/'<comma>angry/,angry./g" ${i}.data
sed -i "s/'<comma>calm/,calm./g" ${i}.data
sed -i "s/'<comma>happy/,happy./g" ${i}.data
sed -i "s/'<comma>sad/,sad./g" ${i}.data
sed -i "s/'<comma>high/,high./g" ${i}.data
sed -i "s/'<comma>groovy/,groovy./g" ${i}.data
sed -i "s/'<comma>lonely/,lonely./g" ${i}.data
sed -i "s/'<comma>sexy/,sexy./g" ${i}.data
sed -i "s/'<comma>energetic/,energetic./g" ${i}.data

sed -i "s/'<comma>romantic/,romantic./g" ${i}.data

sed -i "s/'<comma>sleepy/,sleepy./g" ${i}.data

sed -i "s/'<comma>nostalgic/,nostalgic./g" ${i}.data

sed -i "s/'<comma>funny/,funny./g" ${i}.data

sed -i "s/'<comma>jazzy/,jazzy./g" ${i}.data

#sed -i "s/$/./g" ${i}.data

sed -i 's/\\n/. /g' ${i}.test
sed -i 's/\\r//g' ${i}.test
sed -i 's/\\//g' ${i}.test
sed -i 's/,/<comma>/g' ${i}.test
sed -i "s/^'//g" ${i}.test
sed -i "s/'<comma>angry/,angry./g" ${i}.test
sed -i "s/'<comma>calm/,calm./g" ${i}.test
sed -i "s/'<comma>happy/,happy./g" ${i}.test
sed -i "s/'<comma>sad/,sad./g" ${i}.test
sed -i "s/'<comma>high/,high./g" ${i}.test
sed -i "s/'<comma>groovy/,groovy./g" ${i}.test
sed -i "s/'<comma>lonely/,lonely./g" ${i}.test
sed -i "s/'<comma>sexy/,sexy./g" ${i}.test
sed -i "s/'<comma>energetic/,energetic./g" ${i}.test

sed -i "s/'<comma>romantic/,romantic./g" ${i}.test

sed -i "s/'<comma>sleepy/,sleepy./g" ${i}.test

sed -i "s/'<comma>nostalgic/,nostalgic./g" ${i}.test

sed -i "s/'<comma>funny/,funny./g" ${i}.test

sed -i "s/'<comma>jazzy/,jazzy./g" ${i}.test


sed -i 's/\\n/. /g' ${i}.dev
sed -i 's/\\r//g' ${i}.dev
sed -i 's/\\//g' ${i}.dev
sed -i 's/,/<comma>/g' ${i}.dev
sed -i "s/^'//g" ${i}.dev
sed -i "s/'<comma>angry/,angry./g" ${i}.dev
sed -i "s/'<comma>calm/,calm./g" ${i}.dev
sed -i "s/'<comma>happy/,happy./g" ${i}.dev
sed -i "s/'<comma>sad/,sad/g" ${i}.dev
done

