# venn plot
intervene venn -i ../GM12878_MeRIPseq*peaks.narrowPeak --output venn_WT --save-overlaps
intervene venn -i ../GM12878_SA2KOA13_MeRIPseq*peaks.narrowPeak --output venn_SA2KO --save-overlaps

# upset plot
intervene upset -i ../GM12878_MeRIPseq*peaks.narrowPeak --output upset_WT
intervene upset -i ../GM12878_SA2KOA13_MeRIPseq*peaks.narrowPeak --output upset_SA2KO

# pairwise heatmap
intervene pairwise -i ../GM12878_MeRIPseq*peaks.narrowPeak --type genomic --compute jaccard --htype tribar --output pairwise_WT
intervene pairwise -i ../GM12878_SA2KOA13_MeRIPseq*peaks.narrowPeak --type genomic --compute jaccard --htype tribar --output pairwise_SA2KO
