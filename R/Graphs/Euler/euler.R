#!/usr/bin/env Rscript
# 05.11.2018
# Written by Daniel Schreyer
#### Venn Diagram of 

library(VennDiagram)
library(eulerr)

setwd("C:/Users/Daniel/OneDrive/South-Africa_R-Projects/Week4/Venn_Diagram")

table <- read.table(file = "mock_data.txt", sep = "\t",header = T)
table <- select(table, c("person_id","group","com2","com3","com4","com5"))

group1 <- filter(table, group == 0)
group2 <- filter(table, group == 1)

group1 <- select(group1, starts_with("com"))
group2 <- select(group2, starts_with("com"))

groups <- list(group1, group2)

for (group1 in groups){
  test <- c(A = nrow(filter(group1, group1[1]==1&group1[2]==0&group1[3]==0&group1[4]==0)),
                   B = nrow(filter(group1, group1[1]==0&group1[2]==1&group1[3]==0&group1[4]==0)),
                   C = nrow(filter(group1, group1[1]==0&group1[2]==0&group1[3]==1&group1[4]==0)),
                   D = nrow(filter(group1, group1[1]==0&group1[2]==0&group1[3]==0&group1[4]==1)),
                   "A&B" = nrow(filter(group1, group1[1]==1&group1[2]==1&group1[3]==0&group1[4]==0)),
                   "A&C" = nrow(filter(group1, group1[1]==1&group1[2]==0&group1[3]==1&group1[4]==0)),
                   "A&D" = nrow(filter(group1, group1[1]==1&group1[2]==0&group1[3]==0&group1[4]==1)),
                   "B&C" = nrow(filter(group1, group1[1]==0&group1[2]==1&group1[3]==1&group1[4]==0)),
                   "B&D" = nrow(filter(group1, group1[1]==0&group1[2]==1&group1[3]==0&group1[4]==1)),
                   "C&D" = nrow(filter(group1, group1[1]==0&group1[2]==0&group1[3]==1&group1[4]==1)),
                   "A&B&C" = nrow(filter(group1, group1[1]==1&group1[2]==1&group1[3]==1&group1[4]==0)),
                   "A&B&D" = nrow(filter(group1, group1[1]==1&group1[2]==1&group1[3]==0&group1[4]==1)),
                   "A&C&D" = nrow(filter(group1, group1[1]==1&group1[2]==0&group1[3]==1&group1[4]==1)),
                   "B&C&D" = nrow(filter(group1, group1[1]==0&group1[2]==1&group1[3]==1&group1[4]==1)),
                   "A&B&C&D" = nrow(filter(group1, group1[1]==1&group1[2]==1&group1[3]==1&group1[4]==1)),
)
  fit <-euler(test)
  print(plot(fit, quantities = TRUE))
}


