__author__ = 'linlin'
import os
import logging
import pdb

logger = logging.getLogger('main_module')


def ProcessARFF(arff_path, par_dir):
    file_path = par_dir + '/distress.arff'
    org_file = open(arff_path, 'r')
    new_file = open(file_path, 'w')
    for line in org_file:
        if "@data" in line:
            new_file.write(line)
            break
        new_file.write(line)

    for line in org_file:
        if len(line) != 0:
            line_list = line.split(',')
            ratio = (float(line_list[1]) +1) / (float(line_list[2]) +1)
            line_format = ("%s,%s,%s,%f,%s" %(line_list[0], line_list[1], line_list[2],ratio, line_list[3]))
        new_file.write(line_format)

    org_file.close()
    new_file.close()


if __name__=="__main__":

    arff_path = "/home/linlin/time/040515-stress-classification/Linguisiticpart/pycode/output/data_distress.arff"

    parDir = os.path.dirname(arff_path)
    logFile = parDir + "/logFile.txt"
    logging.basicConfig(filename= logFile, level = logging.DEBUG)

    ProcessARFF(arff_path, parDir)
