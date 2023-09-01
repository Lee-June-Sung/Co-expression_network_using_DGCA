library("DGCA")

setwd("D:\\Desktop\\Reserch\\Ralstonia_Dual_RNA-seq\\2021.02.24_Co-expression_network")
FCdata <- read.table("Plant_MC4.txt", header = T, sep = "\t", row.names = 1)
cell_type = c(rep("MM", 9), rep("MR", 9))
design_mat = makeDesign(cell_type)

dgca_res = ddcorAll(inputMat = FCdata, design = design_mat, compare = c("MM", "MR"), adjust = "perm", nPerm = 10)
head(dgca_res, 20)
write.table(dgca_res, "dgca_res.txt", sep ="\t") 
#plotCors(inputMat = FCdata, design = design_mat, compare = c("MM", "MR"), geneA = "CA.PGAv.1.6.scaffold303.81", geneB = "CA.PGAv.1.6.scaffold793.10")

