__author__ = 'linlin'
import os
import sys
import logging
import pdb
from tools.sentence_label_1 import PureSentLabelCls

logger = logging.getLogger('main')

if __name__=="__main__":

	this_file_path = os.path.abspath( sys.argv[0])
	src_abs_path =  os.path.dirname(this_file_path) 
	logFile = src_abs_path + '/logFile.txt'

	logging.basicConfig(filename= logFile, level = logging.WARNING)

	lex = PureSentLabelCls()
	lex.getPureSentLabel()
