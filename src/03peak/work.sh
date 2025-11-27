# # merge two replicates
# cat GM12878_MeRIPseq_ChrRNA_20220725_B1_peaks.narrowPeak GM12878_MeRIPseq_ChrRNA_20220815_B2_peaks.narrowPeak GM12878_MeRIPseq_ChrRNA_20221118_B3_peaks.narrowPeak |sort -k1,1V -k2,2n|bedtools merge -i - >GM12878_MeRIPseq_ChrRNA_B1B2B3_merged_peaks.bed

# cat GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_peaks.narrowPeak GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_peaks.narrowPeak GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_peaks.narrowPeak |sort -k1,1V -k2,2n|bedtools merge -i - >GM12878_SA2KOA13_MeRIPseq_ChrRNA_B1B2B3_merged_peaks.bed

# # merge Control and cKO peaks
# cat GM12878_MeRIPseq_ChrRNA_B1B2B3_merged_peaks.bed GM12878_SA2KOA13_MeRIPseq_ChrRNA_B1B2B3_merged_peaks.bed |sort -k1,1V -k2,2n|bedtools merge -i - >All_WT_KO_merged_peaks.bed

# merge two replicates
cat GM12878_MeRIPseq_ChrRNA_20220725_B1S2_peaks.narrowPeak GM12878_MeRIPseq_ChrRNA_20220815_B2S2_peaks.narrowPeak GM12878_MeRIPseq_ChrRNA_20221118_B3_peaks.narrowPeak |sort -k1,1V -k2,2n|bedtools merge -i - >GM12878_MeRIPseq_ChrRNA_B1S2B2S2B3_merged_peaks.bed

cat GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_peaks.narrowPeak GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_peaks.narrowPeak GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3_peaks.narrowPeak |sort -k1,1V -k2,2n|bedtools merge -i - >GM12878_SA2KOA13_MeRIPseq_ChrRNA_B1S2B2S2B3_merged_peaks.bed

# merge Control and cKO peaks
cat GM12878_MeRIPseq_ChrRNA_B1S2B2S2B3_merged_peaks.bed GM12878_SA2KOA13_MeRIPseq_ChrRNA_B1S2B2S2B3_merged_peaks.bed |sort -k1,1V -k2,2n|bedtools merge -i - >All_WT_KO_B1S2B2S2B3_merged_peaks.bed
