#!/home/daniel/anaconda3/bin/python3
from optparse import OptionParser
import numpy as np
import pandas as pd
import gzip

parser = OptionParser()
parser.add_option("-v", "--vcf", dest="filename",
                  help="Input: Gzip compressed vcf file", type="string")
parser.add_option("-o", "--output", dest="output",
                  help="Output: csv file with SNP counts per individual", type="string")
(options, args) = parser.parse_args()

filename = options.filename
output = options.output

total_SNPS = 0
with gzip.open(filename, 'rt') as fp:
    for line in fp:
        line = line.rstrip()
        if not line.startswith('#'):
            total_SNPS += 2
            list = line.split('\t')
            num_indiv = len(list) - 9
            indices_hetero = [i for i, item in enumerate(list) if item.startswith('1|0') or item.startswith('0|1')]
            indices_homo = [i for i, item in enumerate(list) if item.startswith('1|1')]
            all_indices = indices_hetero + indices_homo

            if len(all_indices) < 1:
                continue
            elif len(indices_hetero) == 1 and len(indices_homo) == 0:
                index = indices_hetero[0]
                Singleton[index] += 1
            elif len(indices_homo) == 1 and len(indices_hetero) == 0:
                index = indices_homo[0]
                Singleton[index] += 2
            for i in indices_hetero:
                SNP_count[i] += 1
            for j in indices_homo:
                SNP_count[j] += 2
        elif line.startswith("##"):
            continue
        elif line.startswith('#'):
            headerlist = line.split('\t')
            SNP_count = [0] * len(headerlist)
            total = [0] * len(headerlist)
            Singleton = [0] * len(headerlist)

for i in range(len(total)):
    total[i] = total_SNPS

all = np.column_stack((headerlist, total, SNP_count, Singleton))

df = pd.DataFrame(all)
df = df.drop(df.index[0:9])
df.columns = ["Indiv", "total_SNPs", "SNP_count", "Singleton_count"]

df.to_csv(output, index=False, header=True)
