# #GM12878_MeRIPseq_ChrRNA_20221118_B3
# Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam
# Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam
# # peak calling
# macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_MeRIPseq_ChrRNA_20221118_B3 --nomodel --keep-dup 1 -q 0.01 2>GM12878_MeRIPseq_ChrRNA_20221118_B3.macs2.log

# #GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3
# Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_cutadapt.uniq.bam
# Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3_cutadapt.uniq.bam
# # peak calling
# macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3 --nomodel --keep-dup 1 -q 0.01 2>GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3.macs2.log

#GM12878_MeRIPseq_ChrRNA_20220725_B1
Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam
Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam
# peak calling
macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_MeRIPseq_ChrRNA_20220725_B1 --nomodel --keep-dup 1 -q 0.01 2>GM12878_MeRIPseq_ChrRNA_20220725_B1.macs2.log

#GM12878_MeRIPseq_ChrRNA_20220815_B2
Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam
Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam
# peak calling
macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_MeRIPseq_ChrRNA_20220815_B2 --nomodel --keep-dup 1 -q 0.01 2>GM12878_MeRIPseq_ChrRNA_20220815_B2.macs2.log

#GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1
Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt.uniq.bam
Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt.uniq.bam
# peak calling
macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1 --nomodel --keep-dup 1 -q 0.01 2>GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1.macs2.log

#GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2
Treat=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt.uniq.bam
Control=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt.uniq.bam
# peak calling
macs2 callpeak -t $Treat -c $Control -f BAM -g hs -n GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2 --nomodel --keep-dup 1 -q 0.01 2>GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2.macs2.log
