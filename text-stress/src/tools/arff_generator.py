__author__ = 'linlin'
import os
import logging
import pdb

logger = logging.getLogger('main_module')



def GetWordsDic(file_path):
    file = open(file_path, 'r')
    for line in file:
        if ";;;;" in line:
            break
    dict = {}
    for line in file:
        if len(line) != 0:
            dict[line.strip()]= 'exist'
    return dict



def GetSentimentScore(filepath, pos_dic, neg_dic):
    neg_sum = 0
    pos_sum = 0
    file = open(filepath, 'r')
    for line in file:
        if len(line) > 1:
            two_word_list = line.split()
            word = two_word_list[-1].strip()
            if word in pos_dic:
                #pdb.set_trace()
                pos_sum = int(two_word_list[0]) + pos_sum
            if word in neg_dic:
                #pdb.set_trace()
                neg_sum = int(two_word_list[0]) + neg_sum
    file.close()
    return [pos_sum, neg_sum]



def GenerateARFF(paragraph_dir,output_path, pos_dic, neg_dic):
    meta_line = []
    text = []
    for root, dirs, files in os.walk(paragraph_dir):
        for filename in files:
            filepath = os.path.join(root, filename)
            meta_line.append(filename)
            [pos_score, neg_score] = GetSentimentScore(filepath, pos_dic, neg_dic)
            meta_line.append(pos_score)
            meta_line.append(neg_score)
            meta_line.append(0)
            text.append(meta_line)
            meta_line = []

    file = open(output_path, 'w')
    line = '@data'
    file.write(line)
    file.write('\n')
    for line in text:
        line_format = ("%s,%f,%f,%d" %(line[0], line[1], line[2], line[3]))
        file.write(line_format)
        file.write('\n')

    file.close()



if __name__=="__main__":

    positive_words_path = "/home/linlin/time/040515-stress-classification/Linguisiticpart/data/opinion-lexicon-English/positive-words.txt"
    negative_words_path = "/home/linlin/time/040515-stress-classification/Linguisiticpart/data/opinion-lexicon-English/negative-words.txt"
    transcript_dir = "/home/linlin/time/040515-stress-classification/Linguisiticpart/data/transcript-dic"

    parDir = os.path.dirname( os.getcwd())
    arff_path = parDir + "/stress_data.arff"
    logFile = parDir + "/logFile.txt"
    logging.basicConfig(filename= logFile, level = logging.DEBUG)

    positive_dic = {}
    negative_dic = {}
    positive_dic = GetWordsDic(positive_words_path)
    negative_dic = GetWordsDic(negative_words_path)

    GenerateARFF(transcript_dir,arff_path, positive_dic, negative_dic)
