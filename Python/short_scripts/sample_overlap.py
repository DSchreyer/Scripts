#!/home/daniel/anaconda3/python3

import os
import gzip
import sys

if len(sys.argv) != 4:
    sys.exit("Please enter dir_1 path, dir_2 path and path to output dir" +
          "text file!")


dir_1 = sys.argv[1]
dir_2 = sys.argv[2]


def get_sample_names(dir):
    """
    :param dir: dir path to vcf.gz files
    :return: directory with chromosome number as key and a list of the sample names as values
    """
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
                        d[chrom] = header
                        break
    return d


panel_1 = get_sample_names(dir_1)
panel_2 = get_sample_names(dir_2)

lines = []

for chr, samples in panel_1.items():
    for chr2, samples2 in panel_2.items():
        if c == chr2:
            for sample in samples:
                if sample not in samples2:
                    lines.append[sample + " is missing in " + dir_1 " on chromosome" + chr]
            for sample2 in samples2:
                if sample2 not in samples:
                    lines.append[sample2 + " is missing in " + dir_2 " on chromosome" + chr2]


def write_file(output):
    with open(output, "w") as out:
        for line in lines:
            out.writeline(line)


write_file(sys.argv[3])
