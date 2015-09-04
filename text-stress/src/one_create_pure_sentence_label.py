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
	root_dir = os.path.dirname(src_abs_path)
	logFile = root_dir + '/logFile.txt'
	os.system('rm %s' %logFile)
	logging.basicConfig(filename= logFile, level = logging.NOTSET)

	lex = PureSentLabelCls()
	lex.randomize()
	lex.getPureSentLabel()
