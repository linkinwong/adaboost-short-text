readme file for important things
multimodal -  is the data files, 
while 10folds - are just name lists 
individual_emotion folder - only contains one label case
# 2 copy the - text - arff files in to this folder
# 3 Rename the -text - arff file to - multimodal file, which is suitable for icsiboost format
# 3 turn -multimodal -arff file into -multimodal data file, remember that new file is the boost style, the last label is behind this sign <<,>> instead of <comma>
# 4 Delete line 1 to 6 for some reason.
# 5 select all the individual label lyrics into the - individual_emotion files
# 6 all the lyrics minus individual label lyrics = all the lyrics without that label
# 6 from -not{i} get the same num of lines as in the -{i}.sorted. They form the negative instance. 
# 7 copy the negative data -not{i}.head* to - lyrics folder   copy the positive data -data.{i} to - lyrics folder 
# 8 -list find the name for - individual emotion data.  note that
# -multimodal_10folds_1.data and the -10folds_1_multimodal_train.list have the
# same order of lyrics. Actually all the lyric files.
# 8 - train and test list just copy the -list/..train.list files to the binary
# classification folder.
