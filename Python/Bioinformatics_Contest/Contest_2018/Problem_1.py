#!/bin/python

t = 2
liste = [[2,4,10],[7,5,23]]

for i in range(2):
    glucose, oxygen, euro = liste[i]
    n = euro/(6*oxygen+1*glucose)
    atp = n*38

    max_ox = int(n*6)
    max_gluc = int((euro - max_ox*oxygen)/glucose)
    resp = max_ox/6
    atp2 = resp*38+(max_gluc-resp)*2
    print(atp2)

#correct
#fermentation 1 mole Glucose --> produces 2 mols of atp

# aerobic respiration needs oxygen and glucose:
# 1 mole glucose + 6 mole oxygen --> 38 mole ATP

n = 2
l = [[2,4,10], [7,5,23]]

for i in range(n):
    gluc, ox, eu = l[i]