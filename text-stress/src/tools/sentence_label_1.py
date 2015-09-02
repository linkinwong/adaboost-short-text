import os
import pdb
import logging

logger = logging.getLogger('main.lexicoExtractCls')

class PureSentLabelCls():
	
	def __init__(self):
		tools_file_path = os.path.abspath( __package__)
		root_abs_path =os.path.dirname( os.path.dirname(tools_file_path) ) 
		self.path_manual_label_sentence = root_abs_path + '/data/complete_data_sentence.txt'
		self.pure_manual_label_sentence = root_abs_path + '/data/1_pure_label_sentence.txt'

	def getPureSentLabel(self):
		file_handler_input = open( self.path_manual_label_sentence, 'r' )
		output_file_handler = open( self.pure_manual_label_sentence, 'w' )
		for line in file_handler_input:
			if len(line.strip() ) == 0:
				first_3_flag = 1
				n_th_line=1
				continue
			if first_3_flag == 1:
				list_label = ( line.strip() ).split()
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
				n_th_line += 1
				output_file_handler.write (str_format + '\n')

		file_handler_input.close()
		output_file_handler.close()

