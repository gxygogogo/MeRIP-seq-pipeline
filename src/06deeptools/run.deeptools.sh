#!/bin/bash

#../01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam
#../01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam
#../01mapping/GM12878_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt.uniq.bam
#../01mapping/GM12878_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt.uniq.bam
#../01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam
#../01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam
#../01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt.uniq.bam
#../01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt.uniq.bam

multiBamSummary bins --bamfiles \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam \
--labels SA2WT_B1 SA2WT_B2 SA2WT_B3 SA2WT_input_B1 SA2WT_input_B2 SA2WT_input_B3 SA2KO_B1 SA2KO_B2 SA2KO_B3 SA2KO_input_B1 SA2KO_input_B2 SA2KO_input_B3 --minMappingQuality 30 -o B1B2B3_results.npz

plotCorrelation \
-in B1B2B3_results.npz \
--corMethod pearson --skipZeros \
--plotTitle "Pearson Correlation of Average Scores Per Transcript" \
--whatToPlot scatterplot \
-o B1B2B3_scatterplot_PearsonCorr_bigwigScores.png   \
--outFileCorMatrix B1B2B3_PearsonCorr_bigwigScores.tab

plotCorrelation \
-in B1B2B3_results.npz \
--corMethod pearson --skipZeros \
--plotTitle "Pearson Correlation of Read Counts" \
--whatToPlot heatmap --plotNumbers \
-o B1B2B3_heatmap_PearsonCorr_readCounts.png   \
--outFileCorMatrix B1B2B3_PearsonCorr_readCounts.tab
 
plotCorrelation \
-in B1B2B3_results.npz \
--corMethod spearman --skipZeros \
--plotTitle "Spearman Correlation of Read Counts" \
--whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
-o B1B2B3_heatmap_SpearmanCorr_readCounts.png   \
--outFileCorMatrix B1B2B3_SpearmanCorr_readCounts.tab

plotPCA -in B1B2B3_results.npz \
-o B1B2B3_PCA_readCounts.png \
-T "PCA of read counts"

plotFingerprint \
-b \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam \
--labels SA2WT_B1 SA2WT_B2 SA2WT_B3 SA2WT_input_B1 SA2WT_input_B2 SA2WT_input_B3 SA2KO_B1 SA2KO_B2 SA2KO_B3 SA2KO_input_B1 SA2KO_input_B2 SA2KO_input_B3 \
--minMappingQuality 30 --skipZeros \
--region 19 --numberOfSamples 50000 \
-T "Fingerprints of different samples"  \
--plotFile B1B2B3_fingerprints.png \
--outRawCounts B1B2B3_fingerprints.tab
#######################################################################################################################
dir=/data/xinyu/CohesinProject/MeRIP-seq/02coverage
#####matrix binsize=50bp

computeMatrix reference-point --referencePoint center -R ../03peak/All_WT_KO_merged_peaks.bed \
-S \
$dir/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
-b 2000 -a 2000 -o All.sample_B1B2B3.center.matrix.gz --samplesLabel SA2WT_B1 SA2WT_B2 SA2WT_B3 SA2KO_B1 SA2KO_B2 SA2KO_B3

#####heatmap
plotHeatmap --heatmapHeight 25 --heatmapWidth 6 --colorMap Oranges Blues Reds Greens -m All.sample_B1B2B3.center.matrix.gz -out All.sample_B1B2B3.center.matrix.pdf --outFileSortedRegions All.sample_B1B2B3.center.matrix.bed --boxAroundHeatmaps no
#--perGroup --zMax 45 75 25 75 25 25
#--colorList '#6495ED,white,#FF4500'
#--colorList 'black, yellow' 'white,blue' '#ffffff,orange,#000000'

###################################################################################################
### DE peaks heatmap####
# all sample
dir=/data/xinyu/CohesinProject/MeRIP-seq/02coverage
#for i in cluster1 cluster2 cluster3 cluster4 cluster5 cluster6;do
	#computeMatrix reference-point --referencePoint center -S /data2/dongwei/projects/Cardiac_Aging_Project/ChIP-seq/Histone/H3K27Ac/02coverage/*extent.cov_nor.bw -R ${i}.bed -a 2000 -b 2000 -p 10 --skipZero -o all.${i}.center.matrix.gz
#	computeMatrix scale-regions -S $dir/P14Naive_ChIPseq_H3K27ac_20211104_B1.cov_nor.bw $dir/P14Effector_ChIPseq_H3K27ac_20211104_B1.cov_nor.bw $dir/P14Memory_ChIPseq_H3K27ac_20211104_B1.cov_nor.bw -R DE_${i}.bed -m 3000 -p 10 --samplesLabel Naive Effector Memory --skipZero -o all.${i}.region.matrix.gz
#	plotProfile -m all.${i}.region.matrix.gz --perGroup -o all.${i}.profile.pdf
#	plotHeatmap -m all.${i}.region.matrix.gz -o all.${i}.heatmap.pdf --heatmapHeight 10 --colorMap Reds 
#done

cut -d"," -f1 ../05DE_peak/SA2KO_vs_SA2WT_B1B2B3.DESeq2.DEs.up.csv |grep "chr"|sed 's/[:-]/\t/g'|sort -k1,1V -k2,2n >B1B2B3_DE_up.bed
cut -d"," -f1 ../05DE_peak/SA2KO_vs_SA2WT_B1B2B3.DESeq2.DEs.down.csv |grep "chr"|sed 's/[:-]/\t/g'|sort -k1,1V -k2,2n >B1B2B3_DE_down.bed
#####matrix binsize=50bp
computeMatrix reference-point --referencePoint center -R B1B2B3_DE_up.bed B1B2B3_DE_down.bed \
-S \
$dir/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
-b 2000 -a 2000 -o All.DE.sample_B1B2B3.center.matrix.gz --samplesLabel SA2WT_B1 SA2WT_B2 SA2WT_B3 SA2KO_B1 SA2KO_B2 SA2KO_B3

#####heatmap
plotHeatmap --heatmapHeight 25 --heatmapWidth 6 --colorMap Oranges Blues Reds Greens -m All.DE.sample_B1B2B3.center.matrix.gz -out All.DE.sample_B1B2B3.center.matrix.pdf --outFileSortedRegions All.DE.sample_B1B2B3.center.matrix.bed --boxAroundHeatmaps no --yMax 350 350 180 180
#--perGroup --zMax 45 75 25 75 25 25

### DE genes heatmap####
#####matrix binsize=50bp
computeMatrix scale-regions -R B1B2B3_DE_gene_up.bed B1B2B3_DE_gene_down.bed \
-S \
$dir/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.cov_nor.bw \
$dir/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.cov_nor.bw \
-b 2000 -a 2000 --regionBodyLength 5000 -o All.DE.gene.sample_B1B2B3.region.matrix.gz --samplesLabel SA2WT_B1 SA2WT_B2 SA2WT_B3 SA2KO_B1 SA2KO_B2 SA2KO_B3

#####heatmap
plotHeatmap --heatmapHeight 25 --heatmapWidth 6 --colorMap Oranges Blues Reds Greens -m All.DE.gene.sample_B1B2B3.region.matrix.gz -out All.DE.gene.sample_B1B2B3.region.matrix.pdf --kmeans 3 --outFileSortedRegions All.DE.gene.sample_B1B2B3.region.matrix.bed --boxAroundHeatmaps no
#--perGroup --zMax 45 75 25 75 25 25

