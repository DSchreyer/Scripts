#!/bin/env Rscript
# Dec 11, 2018
# Daniel Schreyer
# Venn Diagram for concordance of 2 datasets

library(dplyr)
library(ggplot2)
library(optparse)
library(VennDiagram)

sanger <- read.table("/home/daniel/gdrive/SA/output/uniq_sanger_SNPs.txt")
uct <- read.table("/home/daniel/gdrive/SA/output/uniq_uct_SNPs.txt")

overlap <- calculate.overlap(
  x = list("sanger" = sanger$V1,
           "uct" = uct$V1)
)

l = list("Sanger" = sanger$V1,
         "UCT" = uct$V1)

venn.diagram(l, filename = "/home/daniel/gdrive/SA/output/venn.tiff", 
             imagetype = "tiff", main = "SNP Overlap", 
                     euler.d = TRUE, scaled = TRUE)


