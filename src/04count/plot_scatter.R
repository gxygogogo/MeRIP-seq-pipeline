library(ggplot2)
library(ggpubr)
##### B1 vs B2
data <- read.table("All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt",header=T,sep="\t",check.names=F)
data <- data[,c(1:6,10:11)]
colnames(data) <- c(colnames(data)[1:6],"SA2KO_B1S2","SA2KO_B2S2")
head(data)
#  Geneid  Chr   Start     End Strand Length Ythdc1_Control_RIP_r1
#1  peak1 chr1 3670562 3671703      +   1142                    34
#2  peak2 chr1 4258856 4259188      +    333                    37
#3  peak3 chr1 4461192 4461570      +    379                    11
pdf("SA2KO_B1S2_B2S2_corraltion_scatterplot.pdf")
ggplot(data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B2S2+1)))+
  geom_point(colour="#000099")+geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B2S2+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20)+
  theme_bw()
dev.off()

pdf("SA2KO_B1S2_B2S2_corraltion_scatterplot2.pdf")
ggplot(data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B2S2+1)))+
  stat_density2d(aes(fill = ..density..), geom = "raster", contour = F) + 
  scale_fill_gradientn(colours=c("white","SkyBlue","green","yellow","red","DarkRed")) +
  geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B2S2+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20)+
  theme_bw() +
  theme(panel.grid=element_blank(),legend.position = c(0.85,0.3),legend.background = element_blank())
dev.off()


##### B1 vs B3
data <- read.table("All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt",header=T,sep="\t",check.names=F)
data <- data[,c(1:6,10,12)]
colnames(data) <- c(colnames(data)[1:6],"SA2KO_B1S2","SA2KO_B3")
head(data)
#  Geneid  Chr   Start     End Strand Length Ythdc1_cKO_RIP_r1 Ythdc1_cKO_RIP_r2
#1  peak1 chr1 3138988 3139374      +    387                20                 6
#2  peak2 chr1 3300268 3300887      +    620                38                28
#3  peak3 chr1 3361247 3361633      +    387                35                 8
pdf("SA2KO_B1S2_B3_corraltion_scatterplot.pdf")
ggplot(data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B3+1)))+
  geom_point(colour="#000099")+ 
  geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B3+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20)+
  theme_bw()
dev.off()

pdf("SA2KO_B1S2_B3_corraltion_scatterplot2.pdf")
ggplot(data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B3+1)))+
  stat_density2d(aes(fill = ..density..), geom = "raster", contour = F) + 
  scale_fill_gradientn(colours=c("white","SkyBlue","green","yellow","red","DarkRed")) +
  geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B1S2+1),log2(SA2KO_B3+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20) +
  theme_bw() +
  theme(panel.grid=element_blank(),legend.position = c(0.85,0.3),legend.background = element_blank())
dev.off()

##### B2 vs B3
data <- read.table("All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt",header=T,sep="\t",check.names=F)
data <- data[,c(1:6,11,12)]
colnames(data) <- c(colnames(data)[1:6],"SA2KO_B2S2","SA2KO_B3")
head(data)
#  Geneid  Chr   Start     End Strand Length Ythdc1_cKO_RIP_r1 Ythdc1_cKO_RIP_r2
#1  peak1 chr1 3138988 3139374      +    387                20                 6
#2  peak2 chr1 3300268 3300887      +    620                38                28
#3  peak3 chr1 3361247 3361633      +    387                35                 8
pdf("SA2KO_B2S2_B3_corraltion_scatterplot.pdf")
ggplot(data,aes(log2(SA2KO_B2S2+1),log2(SA2KO_B3+1)))+
  geom_point(colour="#000099")+ 
  geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B2S2+1),log2(SA2KO_B3+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20)+
  theme_bw()
dev.off()

pdf("SA2KO_B2S2_B3_corraltion_scatterplot2.pdf")
ggplot(data,aes(log2(SA2KO_B2S2+1),log2(SA2KO_B3+1)))+
  stat_density2d(aes(fill = ..density..), geom = "raster", contour = F) + 
  scale_fill_gradientn(colours=c("white","SkyBlue","green","yellow","red","DarkRed")) +
  geom_smooth(method = 'lm', se = T, color = 'red')+
  stat_cor(data=data,aes(log2(SA2KO_B2S2+1),log2(SA2KO_B3+1)), method = "pearson") + 
  xlim(0,20) + 
  ylim(0,20) +
  theme_bw() +
  theme(panel.grid=element_blank(),legend.position = c(0.85,0.3),legend.background = element_blank())
dev.off()



