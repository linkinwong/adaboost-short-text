for i in stereomood_more_categories_multimodal_10folds
do
sed -i 's/<.*>//g' ${i}.data
sed -i 's/(x.)//g' ${i}.data

sed -i 's/<.*>//g' ${i}.test
sed -i 's/(x.)//g' ${i}.test
done

