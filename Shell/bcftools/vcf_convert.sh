#!/usr/bin/env bash

bcftools view "/mnt/c/Users/Daniel/OneDrive/South-Africa_R-Projects/Week1/Testdata/targetTestdata_clean.chr6_428721-20428720_testRefPanel-phased_imputed.dose.vcf.gz" \
| bcftools query -f "[%SAMPLE\t%INFO/AF\t%INFO/MAF\t%INFO/IMPUTED\t%GT\n]" | sed '1iSample\tAF\t\MAF\tImputed\tGT' > test.txt

#zcat /mnt/c/Users/Daniel/OneDrive/South-Africa_R-Projects/Week1/Testdata/targetTestdata_clean.chr6_428721-20428720_testRefPanel-phased_imputed.dose.vcf.gz | vcf-to-tab > out.txt

#/mnt/c/Users/Daniel/OneDrive/South-Africa_R-Projects/Week1/Testdata/targetTestdata_clean.chr6_428721-20428720_testRefPanel-phased_imputed.dose.vcf.gz > test.txt