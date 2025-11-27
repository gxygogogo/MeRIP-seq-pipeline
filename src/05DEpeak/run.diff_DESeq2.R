library(DESeq2)
library(RColorBrewer)
library(pheatmap)
library(ggplot2)

setwd("/data/xinyu/CohesinProject/MeRIP-seq/05DE_peak")

# 读取count数据
data <- read.table("All_WT_KO_B1B2B3_merged_peaks_count.txt",header=T,sep="\t")
head(data)
# 去除重复的基因
data <- data[!duplicated(data$Peak),]
rownames(data) <- data$Peak
data <- data[,c(2:7)]
head(data)

# 构建分组信息
meta <- factor(rep(c('SA2WT','SA2KO'), each=3), levels = c("SA2WT","SA2KO"))
meta <- data.frame(group=meta, batch=c(1,2,3,1,2,3),row.names=colnames(data))
head(meta)

# 构建dds对象
#dds <- DESeqDataSetFromMatrix(countData=data, colData=meta, design=~batch+group)
dds <- DESeqDataSetFromMatrix(countData=data, colData=meta, design=~group)
dds

# 数据过滤
#keep <- rownames(dds)[rowSums(counts(dds)) > 1]
#keep <- rowSums(counts(dds) >= 10) >= 3  #过滤低表达基因，至少有3个样品都满足10个以上的reads数  
keep <- rowSums(counts(dds)) >= 5
dds <- dds[keep,]

# 数据标准化
#rld <- rlog(dds, blind = FALSE) #得到经过DESeq2软件normalization的表达矩阵！
#exprSet=assay(rld)
#head(exprSet)
vsd <- vst(dds, blind=FALSE) #vst()函数效果和rlog()一样，且速度更快。
exprSet=assay(vsd)
head(exprSet)
write.csv(exprSet,"exprSet_B1B2B3_vst_normalized.csv",quote=F)

# 样本相关性
#Euclidean distance
sampleDists <- dist(t(assay(vsd)))
sampleDists
sampleDistMatrix <- as.matrix(sampleDists )
rownames(sampleDistMatrix) <- colnames(exprSet)
colnames(sampleDistMatrix) <- NULL

colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pdf(file = './sample_B1B2B3_distance.pdf',width = 7,height = 6.5)
pheatmap(sampleDistMatrix,
         clustering_distance_rows = sampleDists,
         clustering_distance_cols = sampleDists,
         col = colors,
         main = 'sample euclidean distance')
dev.off()

sampleCor <- cor(assay(vsd))
pdf(file = './sample_B1B2B3_correlation.pdf',width = 7,height = 6.5)
pheatmap(sampleCor)
dev.off()

# PCA降维
#plot by ggplot2
pcaData <- plotPCA(vsd, intgroup = c("group"), returnData = TRUE)
pcaData
percentVar <- round(100 * attr(pcaData, "percentVar"))
percentVar
pdf(file = './PCA_by_B1B2B3.pdf',width =5.5,height =5)
ggplot(pcaData, aes(x = PC1, y = PC2, color = group, shape = group)) +
  geom_point(size =3) + theme_bw() +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
#  coord_fixed() +
  ggtitle("PCA with VST data")
dev.off()

# 差异分析
dds <- DESeq(dds)
resultsNames(dds)

res <- results(dds,contrast=c("group","SA2KO","SA2WT"))
summary(res)

# MA plot without shrink
pdf(file = './MA_plot_without_shrink.pdf',width = 7,height = 6)
plotMA(res, ylim = c(-6, 6))
dev.off()

# 结果保存
##筛选差异表达基因
#首先对表格排个序，按 padj 值升序排序，相同 padj 值下继续按 log2FC 降序排序
res1 <- res[order(res$padj, res$log2FoldChange, decreasing = c(FALSE, TRUE)), ]
res1 <- as.data.frame(res1)
#log2FC≥1 & padj<0.01 标识 up，代表显著上调的基因
#log2FC≤-1 & padj<0.01 标识 down，代表显著下调的基因
#其余标识 none，代表非差异的基因
res1[which(res1$log2FoldChange >= 1 & res1$padj < 0.05),'sig'] <- 'Up'
res1[which(res1$log2FoldChange <= -1 & res1$padj < 0.05),'sig'] <- 'Down'
res1[which(abs(res1$log2FoldChange) <= 1 | res1$padj >= 0.05),'sig'] <- 'None'
write.csv(res1, file = 'SA2KO_vs_SA2WT_B1B2B3.DESeq2.all.csv', col.names = NA, quote = FALSE)

#输出选择的差异基因总表
res1_select <- subset(res1, sig %in% c('Up', 'Down'))
write.csv(res1_select, file = 'SA2KO_vs_SA2WT.DESeq2.DEs.csv', col.names = NA, quote = FALSE)

#根据 up 和 down 分开输出
res1_up <- subset(res1, sig == 'Up')
res1_down <- subset(res1, sig == 'Down')

write.csv(res1_up, file = 'SA2KO_vs_SA2WT_B1B2B3.DESeq2.DEs.up.csv', col.names = NA, quote = FALSE)
write.csv(res1_down, file = 'SA2KO_vs_SA2WT_B1B2B3.DESeq2.DEs.down.csv', col.names = NA, quote = FALSE)

##ggplot2 差异火山图
#默认情况下，横轴展示 log2FoldChange，纵轴展示 -log10 转化后的 padj
p <- ggplot(data = res1, aes(x = log2FoldChange, y = -log10(padj), color = sig)) +
	geom_point(size = 1) + #绘制散点图
	scale_color_manual(values = c('red', 'gray', 'green'), limits = c('Up', 'None', 'Down')) + #自定义点的颜色
	labs(x = 'log2 Fold Change', y = '-log10 adjust p-value', title = 'SA2KO vs SA2WT', color = '') + #坐标轴标题
	theme(plot.title = element_text(hjust = 0.5, size = 14), panel.grid = element_blank(), #背景色、网格线、图例等主题修改
	panel.background = element_rect(color = 'black', fill = 'transparent'),
	legend.key = element_rect(fill = 'transparent')) +
	geom_vline(xintercept = c(-1, 1), lty = 3, color = 'black') + #添加阈值线
	geom_hline(yintercept = -log10(0.05), lty = 3, color = 'black') +
	xlim(-15, 15) + ylim(0, 16)+ #定义刻度边界
  annotate("text", x=10, y=15, label=dim(res1_up)[1])+
  annotate("text", x=-10, y=15, label=dim(res1_down)[1])
pdf("Volcano_B1B2B3_plot.pdf",height=5.5,width=6)
print(p)
dev.off()
