import os
import pdb
import logging
import random

logger = logging.getLogger('main.sentence_label')
logger.setLevel(logging.WARNING)

class PureSentLabelCls():
	
	def __init__(self):
		tools_file_path = os.path.dirname( __file__)
		root_abs_path =os.path.dirname( os.path.dirname(tools_file_path) ) 
		self.one_pure_list_dir = root_abs_path + '/data/1-pure-format-list'
		os.system ('%s %s' %( 'mkdir -p',self.one_pure_list_dir ) )
		self.path_manual_label_sentence = root_abs_path + '/data/complete_data_sentence.txt'
		self.pure_manual_label_sentence = self.one_pure_list_dir + '/pure'

	def getPureSentLabel(self):
		file_handler_input= self.one_pure_list_dir + '/ori_random_input'
		list_file_path = self.one_pure_list_dir + '/pure_list'
		input_file= open( file_handler_input, 'r' )
		output_file_handler = open( self.pure_manual_label_sentence, 'w' )
		list_file_handler = open( list_file_path, 'w' )
		logger.info("what in the input file: %s ", file_handler_input )
		for line in input_file:
			if len(line.strip() ) == 0:
				first_3_flag = 1
				n_th_line=1
				continue
			if first_3_flag == 1:
				list_label = ( line.strip() ).split()
				first_3_flag += 1
				continue
			if first_3_flag == 2:
				file_name = ( (line.strip()).split('.') )[0]
				first_3_flag += 1
				continue
			if first_3_flag <= 3:
				first_3_flag += 1
				continue
			if len( line.strip() ) > 0:
				line = line.strip()
				if len( list_label ) < n_th_line:
					str_format = line + ',notstress'
				else:
					str_label = 'stress' if list_label[n_th_line -1 ] == '1' else 'nostress'
					str_format = line + ',' + str_label

				name_str = file_name + '_' + str(n_th_line)
				n_th_line += 1
				output_file_handler.write (str_format + '\n')
				list_file_handler.write (name_str + '\n')
				logger.info("the name string is %s", name_str )

		input_file.close()
		output_file_handler.close()
		list_file_handler.close()

	def randomize(self):
		file_handler_input = open( self.path_manual_label_sentence, 'r' )
		randomized_ori_file_path = self.one_pure_list_dir + '/ori_random_input'
		ori_random_handler = open( randomized_ori_file_path, 'w' )

		dialogue_dic = {}
		key = 'NONE'
		dialogue = 'nothing\n'
		for line in file_handler_input:
			if len(line.strip() ) == 0:
				dialogue_dic[key] = dialogue
				dialogue = line
				continue
			if 'dataOri' in line:
				key = line.strip()
			if len( line.strip() ) > 0:
				dialogue = dialogue + line

		dialogue_dic.pop('NONE')
		key_list = dialogue_dic.keys()
		random.shuffle( key_list )
		for k in key_list:
			ori_random_handler.write( dialogue_dic[k] )

		file_handler_input.close()
		ori_random_handler.close()
