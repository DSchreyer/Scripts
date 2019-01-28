#!/home/daniel/anaconda3/bin/python3
import numpy as np
import pandas

first_line = True
num_SNPs = 0

with open('/home/daniel/gdrive/SA/alelle_freqs/fixed/all.txt', 'rt') as fp:
    for line in fp:
        line = line.rstrip()
        list = line.split('\t')
        del list[0]
        if first_line:
            length = len(list)
            header = list
            num_unique = [0] * length
            num_snps = [0] * length
            first_line = False
        else:
            num_SNPs += 1
            index = [i for i, item in enumerate(list) if float(item) > 0]
            if len(index) > 1:
                continue
            elif len(index) == 1:
                num_unique[index[0]] += 1

for i in range(len(num_snps)):
    num_snps[i] = num_SNPs


df = np.column_stack((header, num_unique, num_snps))
df = pandas.DataFrame(df)
df.rename(columns={"Population": 0, "unique_SNPs": 1, "total_SNPs": 2})
df.to_csv("unique_snps.csv", index=False, header=True)



