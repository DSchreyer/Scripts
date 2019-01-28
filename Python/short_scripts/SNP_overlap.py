#!/home/daniel/anaconda3/python3

import os
import gzip
import sys

if len(sys.argv) != 4:
    sys.exit("Please enter path to dir 1, path to dir 2 and path to output " +
          "text file!")


dir_1 = sys.argv[1]
dir_2 = sys.argv[2]


def get_sample_names(direct):
    d = {}
    for filename in os.listdir(direct):
        if filename.endswith(".vcf.gz"):
            with gzip.open(direct + filename, 'rt') as fp:
                for line in fp:
                    line = line.rstrip()
                    if line.startswith("##"):
                        continue
                    elif line.startswith('#'):
                        header = line.split("\t")[10:]
                    else:
                        chrom = line.split("\t")[0]
                        break
        d[chrom] = header
    return d
