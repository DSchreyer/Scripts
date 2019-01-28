install.packages('VennDiagram',repo="http://cran.r-project.org",dep=TRUE)
library(VennDiagram)
library(ggplot)


golden <- read.table("venn_highAFR_26_sim_reads_high_golden.ps", header = T)
attach(golden)

bcf <- read.table("venn_highbcftools.ps",header = T)
attach(bcf)

lofrd <- read.table("venn_highlofreq.ps",header = T)
attach(lofrd)

Samtools <- read.table("venn_highsamtools.ps",header = T)
attach(Samtools)

Platypus <- read.table("venn_highPlatypus.ps",header = T)
attach(Platypus)

GATK <- read.table("venn_highGATK.ps",header = T)
attach(GATK)




likes <- function(animals) {
  ppl <- d
  names(ppl) <- c("p", "d", "c", "s", "f", "t")
  for (i in 1:length(animals)) {
    ppl <- subset(ppl, ppl[animals[i]] == T)
  }
  nrow(ppl)
}

c <- list(GOLDEN=$golden,BCFTOOLS=$bcf,LOFREQ=$lofrd,SAMTOOLS=$Samtools, Platypus=$Platypus , GATK=$GATK)
#grid.draw(V)
venn.diagram(c, include= "both", names = c("Golden", "BCFTOOLS","LOFREQ", "SAMTOOLS", "Platypus", "GATK"), cex = 1, counts.col = "red",filename = "AFR_High.tiff",fill = c("orange","cornflowerblue","green", "blue", "red", "darkorchid1"))
0
