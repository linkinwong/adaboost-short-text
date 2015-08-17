for i in sad high groovy happy lonely sexy energetic romantic angry sleepy nostalgic funny jazzy calm
do
grep ,${i} stereomood_more_categories_multimodal_10folds.data > individual_emotion/stereomood_more_categories_multimodal_10folds.data.${i}
grep ,${i} stereomood_more_categories_multimodal_10folds.test > individual_emotion/stereomood_more_categories_multimodal_10folds.test.${i}
done
