# peak bed to gtf file
#cat ../03peak/Ythdc1_Control_RIP_r1r2_merged_peaks.bed |awk 'OFS="\t"{print $1,".","gene",$2,$3,".","+",".","gene_id peak"NR";"}' > Ythdc1_Control_RIP_r1r2_merged_peaks.gtf

#cat ../03peak/Ythdc1_cKO_RIP_r1r2_merged_peaks.bed |awk 'OFS="\t"{print $1,".","gene",$2,$3,".","+",".","gene_id peak"NR";"}' > Ythdc1_cKO_RIP_r1r2_merged_peaks.gtf

cat ../03peak/All_WT_KO_B1S2B2S2B3_merged_peaks.bed |awk 'OFS="\t"{print $1,".","gene",$2,$3,".","+",".","gene_id peak"NR";"}' > All_WT_KO_B1S2B2S2B3_merged_peaks.gtf
cat ../03peak/All_WT_KO_merged_peaks.bed |awk 'OFS="\t"{print $1,".","gene",$2,$3,".","+",".","gene_id peak"NR";"}' > All_WT_KO_B1B2B3_merged_peaks.gtf
# peak featurecount
#/data/public/software/subread-1.6.4-Linux-x86_64/bin/featureCounts -a Ythdc1_Control_RIP_r1r2_merged_peaks.gtf -o Ythdc1_Control_RIP_r1r2_merged_peaks_count.txt ../01mapping/Ythdc1_Control_RIP_r1.nodup.bam ../01mapping/Ythdc1_Control_RIP_r2.nodup.bam -t gene -g gene_id -T 6

#/data/public/software/subread-1.6.4-Linux-x86_64/bin/featureCounts -a Ythdc1_cKO_RIP_r1r2_merged_peaks.gtf -o Ythdc1_cKO_RIP_r1r2_merged_peaks_count.txt ../01mapping/Ythdc1_cKO_RIP_r1.nodup.bam ../01mapping/Ythdc1_cKO_RIP_r2.nodup.bam -t gene -g gene_id -T 6

/data/public/software/subread-1.6.4-Linux-x86_64/bin/featureCounts -a All_WT_KO_B1S2B2S2B3_merged_peaks.gtf -o All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt \
/data3/dongwei/Cohesin_Project/m6A_MeRIP-seq/SA2KO_combined/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam \
/data3/dongwei/Cohesin_Project/m6A_MeRIP-seq/SA2KO_combined/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data3/dongwei/Cohesin_Project/m6A_MeRIP-seq/SA2KO_combined/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam \
/data3/dongwei/Cohesin_Project/m6A_MeRIP-seq/SA2KO_combined/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
-t gene -g gene_id -T 6


/data/public/software/subread-1.6.4-Linux-x86_64/bin/featureCounts -a All_WT_KO_B1B2B3_merged_peaks.gtf -o All_WT_KO_B1B2B3_merged_peaks_count.txt \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam \
-t gene -g gene_id -T 6