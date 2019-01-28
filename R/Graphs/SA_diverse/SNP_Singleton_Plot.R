#!/usr/bin/Rscript
library(dplyr)
library(ggplot2)
library(optparse)
library(tidyr)



df <- read.csv("/home/daniel/OneDrive/South-Africa_R-Projects/Week4/VCF_individual_plot/SNP_Singleton.csv", header = T)

df2 <- df %>% separate(Indiv, c("Indiv", "num", "pop", "type", "Indiv2", "num2", "pop2", "type2","ID"), "_")
df2 <- df2 %>% filter(type == "CON") %>% group_by(pop) %>%
  summarise(mean = mean(SNP_count), sd = sd(SNP_count))

total <- mean(df$total_SNPs)

max(df$Singleton_count)

df <- df[1:50,]

p <- ggplot(df2, aes(x = pop, y = mean)) + geom_histogram(stat = "identity") +
  geom_errorbar(aes(ymin=mean-sd, ymax = mean+sd), width = .2) +
  scale_y_continuous(labels = scales::comma) + theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  xlab(label="Population") + ylab(label="Mean SNP Count")
p


