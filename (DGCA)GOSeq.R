
setwd("D:\\Desktop\\Reserch\\Report\\Analysis\\Analysis\\2022.10.24_DGCA\\network_Raw\\node")
library(goseq)

GO = read.table("Pepper_GO_list.txt", header=TRUE,sep = "\t")
KEGG = read.table("Pepper_KEGG_list.txt", header=TRUE,sep = "\t")
Gene_ID = read.table("Gene_Length.txt")

len = read.table("Gene_list.txt")
Gene_ID$V3 <- 0
bias <- Gene_ID$V2
attr(bias, "names") <- Gene_ID$V1
DEGeneID <- Gene_ID$V3
attr(DEGeneID, "names") <- Gene_ID$V1
DEGeneID[len$V1] <- 1
bias <- as.numeric(bias)
pwf = nullp(DEGeneID, bias.data=bias)
pwf
GO.wall <- goseq(pwf, gene2cat=GO[,c(1,2)])
KEGG.wall <- goseq(pwf, gene2cat=KEGG[,c(1,2)])
write.csv(KEGG.wall,"Xcv1_KEGG.csv")
write.csv(GO.wall,"Xcv1_GO.csv")
dev.off()
DEGeneID = ""
len = ""
Gene_ID = ""
bias = ""
pwf = ""
