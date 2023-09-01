library(pheatmap)
library(ComplexHeatmap)
library('dplyr')
library(circlize)
library(edgeR)
setwd("D:\\Desktop\\Reserch\\Report\\Analysis\\Analysis\\2022.10.18_Abio_Bio")

#Read.count <- read.table("Average_Read_PepMoV.txt", header = T,sep = "\t",row.names = 1)
#x <- Read.count
#y <- scale(x) #col
#z <- t(scale(t(x))) #row
#write.csv(z,"PepMoV_Z-score.csv")

  

#Read.count <- read.table("Average_Read_PC.txt", header = T,sep = "\t",row.names = 1)
FC <- read.table("stress.txt", header = T,sep = "\t",row.names = 1)
#FDR <- read.table("Fc/PC_0.585_RLP_FDR.txt", header = T,sep = "\t",row.names = 1)
RPKM <- read.table("test4.txt", header = T,sep = "\t",row.names = 1)
#z <- read.table("RLP_Total_Z-score.txt", header = T,sep = "\t",row.names = 1)
#x <- RPKM
#y <- scale(x) #col
#z <- t(scale(t(x))) #row
#RPKM <- log2(RPKM+1)
#FDR <- -log2(FDR)
RPKM <- as.matrix(RPKM)
FC <- as.matrix(FC)
#FDR <- as.matrix(FDR)
#z <- as.matrix(z)
#write.csv(z,"PC_Z-score.csv")
#yb1 <- colorRampPalette(c("#D8D8D8","#6F6FAB","#3CBA9A","#fab95b","#4B4B96"))(n=1000)
#yb2 <- colorRampPalette(c("#4374D9","#D6FFFF","#FFFFA4","#980000"))(n=1000)
#yb3 <- colorRampPalette(c("RED","BLACK"))(n=2)

#z[is.na(z)] <- 0

#pdf("Htest1.pdf", width = 13.94, height = 12)

#Heatmap(z, name = "Z-score", km = 5, cluster_columns = F, cluster_rows =  T,col = colorRamp2(c(-2,-1,0,1,2), c("#4575B4","#DBEFF6","#FCFDC4","#FEE395","#D9352A")), show_row_names = F, show_column_names = T,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
#Heatmap(RPKM, name = "Log2 FPKM", km = 5, cluster_columns = F, cluster_rows =  T,col = colorRamp2(c(0,1,3,4,8), c("black","darkgreen","Yellow","Orange","red")), show_row_names = F, show_column_names = T,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
#  Heatmap(FC, name = "Log2FC", col = circlize::colorRamp2(c(-4,-2,0,2,4),c("#4B96AA","#3C5064","black","#969628","#FAE650")), show_row_names = T, show_column_names = T, cluster_columns = F,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))
  #Heatmap(FDR, name = "-log2(FDR)",col = circlize::colorRamp2(c(0,2,5),c("black","#22741C","#C4FFBE")), show_row_names = T, show_column_names = T,cluster_columns = F,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))
#dev.off()

  #  Heatmap(CPM, name = "Log2 CPM", cluster_columns = F, cluster_rows =  T,col = colorRamp2(c(0,1,3,4,8), c("black","darkgreen","Yellow","Orange","red")), show_row_names = F, show_column_names = T,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
#Heatmap(FC, name = "Log2FC", km = 5, col = circlize::colorRamp2(c(-4,-2,0,2,4),c("#4B96AA","#3C5064","black","#969628","#FAE650")), show_row_names = T, show_column_names = T, cluster_columns = F,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
#  Heatmap(z, name = "Z-score", cluster_columns = F, cluster_rows =  T,col = colorRamp2(c(-2,-1,0,1,2), c("#4575B4","#DBEFF6","#FCFDC4","#FEE395","#D9352A")), show_row_names = T, show_column_names = T,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))
  #  Heatmap(FDR, name = "-log2(FDR)",col = circlize::colorRamp2(c(0,2,5),c("black","#22741C","#C4FFBE")), show_row_names = T, show_column_names = T,cluster_columns = F,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))


#dev.off()

pdf("HEAT_Last.pdf", width = 13.94, height = 12)

#Heatmap(RPKM, name = "Log2 FPKM", cluster_columns = F, cluster_rows =  T,col = colorRamp2(c(0,1,3,4,8), c("black","darkgreen","Yellow","Orange","red")), show_row_names = F, show_column_names = T,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
Heatmap(RPKM, name = "Log2FC", col = circlize::colorRamp2(c(-4,-2,0,2,4),c("#4B96AA","#3C5064","black","#969628","#FAE650")), show_row_names = T, show_column_names = T, cluster_columns = F,row_names_gp = gpar(fontsize = 6),column_names_gp = gpar(fontsize = 10))+
Heatmap(FC, name = "treatment", col = circlize::colorRamp2(c(1,2,3,4,5,6,7,8,9,10,11),c("#CCCC00","#FF9933","#FFFF66","#FF9999","#66FF66","#66FFFF","#6666FF","#9966FF","#FF66FF","#99CCFF","#FF0033")), show_row_names = T, show_column_names = T, cluster_columns = F)
#  Heatmap(FDR, name = "-log2(FDR)",col = circlize::colorRamp2(c(0,2,5),c("black","#22741C","#C4FFBE")), show_row_names = FALSE, show_column_names = F,cluster_columns = F)

dev.off()
  
