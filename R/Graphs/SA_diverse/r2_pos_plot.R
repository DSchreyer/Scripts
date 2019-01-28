#!/usr/bin/env Rscript
# 25.10.2018
# Daniel Schreyer
# Takes imputation data of a specific region as an input and
# outputs a plot with the chromosome position (x) and the r-squared values(y) of the SNPs

# required packages
library(dplyr)
library(ggplot2)
library(optparse)
library(tidyr)
library(data.table)

# takes input/output filepaths, MAF threshold, 
# the number of imputed and genotyped SNPs in the graph as an option
option_list <- list(
  make_option(c("-i", "--info"), action="store", default = ${info}, type='character',
              help = "Imputation .info file"),
  make_option(c("-t", "--target"), action="store", default = ${target}, type = 'character',
              help = "Target .frq file"),
  make_option(c("-o", "--output"), action="store", default = ${output}, type = 'character',
              help = "Output .png file"),
  make_option(c("-m", "--maf"), action="store", type = 'character',
              help = "Minor allele frequency threshold"),
  make_option(c("-c", "--count"), action="store", default = 50000, type = 'integer',
              help = "Display [] number of SNPs in the plot [Default = 50000] "),
  make_option(c("-g", "--genotyped"), action="store", default = 1000, type = 'integer',
              help = "Number of genotyped SNPs to display as ticks [Default = 1000]")
)

args <- parse_args(OptionParser(option_list = option_list))


# Read in the allele frequency files
info <- fread(file = as.character(args[1]), sep = "\t", header = T, 
              select = c("SNP", "Rsq", "Genotyped", "MAF", "ALT_Frq"))
frq <- fread(file = as.character(args[2]), sep = "\t", header = T, 
             select= c("SNP","CHR","POS"))

# modify SNP ID of frq file
frq <- frq %>% separate("SNP", c("CHR", "Position", "REF", "ALT"), "_" )
frq <- frq %>% mutate(SNP = paste(CHR, POS, REF, ALT, sep = ":"))

# merge tables
full <- merge(frq, info, by = "SNP")

# change chromosome names
full$CHR <- paste("Chromosome", full$CHR, sep = " ")

# extract imputed SNPs and filter out SNPs with missing R-squared values
imputed <- filter(full, Genotyped == "Imputed")
imputed <- filter(imputed, Rsq != "-" | !is.na(Rsq))
genotyped <- filter(full, Genotyped == "Genotyped")

# display only [] imputed SNPs in the r2 - position plot [Default = 50000]
n <- ifelse(nrow(imputed)> args$c, as.integer(nrow(imputed)/args$c, 1))
imputed <- imputed[seq(1, nrow(imputed), n), ]

# display only ~ [] genotyped SNPs as ticks [Default = 1000]
n_2 <- ifelse (nrow(genotyped) > args$g, as.integer(nrow(genotyped)/args$g), 1)
genotyped <- genotyped[seq(1, nrow(genotyped), n_2), ]

# filter out MAF below a given value [Default = 0]
af.thresh <- args[4]
imputed <- filter(imputed, MAF > af.thresh & MAF != 0)

# categorize MAF levels: extreme rare, moderate rare, rare, moderate, common, extreme common
imputed <- mutate(imputed, MAF2 = MAF)

imputed$MAF2[imputed$MAF2 > 0 & imputed$MAF2 <= 0.001] <- "extreme rare (0,0.001]"
imputed$MAF2[imputed$MAF2 > 0.001 & imputed$MAF2 <= 0.01] <- "moderate rare (0.001,0.01]"
imputed$MAF2[imputed$MAF2 > 0.01 & imputed$MAF2 <= 0.02] <- "rare (0.01,0.02]"
imputed$MAF2[imputed$MAF2 > 0.02 & imputed$MAF2 <= 0.05] <- "moderate (0.02,0.05]"
imputed$MAF2[imputed$MAF2 > 0.05 & imputed$MAF2 <= 0.2] <- "common (0.05,0.2]"
imputed$MAF2[imputed$MAF2 > 0.2 & imputed$MAF2 <= 0.5] <- "extreme common (0.2,0.5]"

# plot rsquared vs. SNP_position
r2.position.plot <- ggplot(data = imputed, aes(x = POS, y = Rsq, color = MAF2)) +
  geom_point() +
  labs(x = "Position [bp]", y = "Imputation accuracy (r-squared)") +
  scale_y_continuous(breaks = seq(0, 1, 0.2)) + 
  scale_x_continuous(labels = scales::comma) +
  facet_grid(~CHR) + theme_classic() +
  geom_hline(aes(yintercept = 0.3), colour = "red", show.legend = F) +
  scale_color_discrete(breaks = c("extreme rare (0,0.001]","moderate rare (0.001,0.01]",
                                  "rare (0.01,0.02]", "moderate (0.02,0.05]",
                                  "common (0.05,0.2]","extreme common (0.2,0.5]")) +
  geom_rug(data=genotyped, aes(x = POS), inherit.aes = F)


# save plot as a .png file
ggsave(file = as.character(args[3]), r2.position.plot, width = 10, height = 5.5, units = "in")
