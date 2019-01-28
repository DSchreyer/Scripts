from collections import defaultdict
file = "/home/daniel/gdrive/Testfolder/sample.fa"

d = defaultdict(int)
first = True
with open(file) as file:
    for line in file:
        line.strip()
        if line.startswith(">") and first == True:
            header = line
            all = 0
            first = False
        elif line.startswith(">") and first == False:
            d[header] = d[header]/all
            header = line
            all = 0
        else:
            G= line.count("[GC]")
            d[header] += G
            all += len(line)
    d[header] = d[header]/all

for key, value in d.items():
    print(key + "\t GC-content of: " + str(value))

