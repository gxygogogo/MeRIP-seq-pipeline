#!/bin/bash
bedtools='/data/public/software/bedtools.2.25.0/bin/bedtools'
GENOME_SIZE='/data/public/refGenome/bwa_index/hg38/hg38.chrom.sizes'
bedgraphToBigwig='/home/xinyu/Software/bedGraphToBigWig'

##### WT IP
samtools merge \
GM12878_MeRIPseq_ChrRNA_ALL.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_20221118_B3S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20221118_B3S2_cutadapt.uniq.bam
samtools sort GM12878_MeRIPseq_ChrRNA_ALL.bam -o GM12878_MeRIPseq_ChrRNA_ALL.sorted.bam

${bedtools} genomecov -ibam GM12878_MeRIPseq_ChrRNA_ALL.sorted.bam -bg > GM12878_MeRIPseq_ChrRNA_ALL.bedgraph
cat GM12878_MeRIPseq_ChrRNA_ALL.bedgraph | \
    LANG=C sort -k1,1 -k2,2n > GM12878_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph
${bedgraphToBigwig} GM12878_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph ${GENOME_SIZE} GM12878_MeRIPseq_ChrRNA_ALL.cov.bigwig

gzip GM12878_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph
rm GM12878_MeRIPseq_ChrRNA_ALL.bedgraph
rm *.bam

##### WT input
samtools merge \
GM12878_MeRIPseq_ChrRNA_input_ALL.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_MeRIPseq_ChrRNA_input_20221118_B3S2_cutadapt/GM12878_MeRIPseq_ChrRNA_input_20221118_B3S2_cutadapt.uniq.bam
samtools sort GM12878_MeRIPseq_ChrRNA_input_ALL.bam -o GM12878_MeRIPseq_ChrRNA_input_ALL.sorted.bam

${bedtools} genomecov -ibam GM12878_MeRIPseq_ChrRNA_input_ALL.sorted.bam -bg > GM12878_MeRIPseq_ChrRNA_input_ALL.bedgraph
cat GM12878_MeRIPseq_ChrRNA_input_ALL.bedgraph | \
    LANG=C sort -k1,1 -k2,2n > GM12878_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph
${bedgraphToBigwig} GM12878_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph ${GENOME_SIZE} GM12878_MeRIPseq_ChrRNA_input_ALL.cov.bigwig

gzip GM12878_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph
rm GM12878_MeRIPseq_ChrRNA_input_ALL.bedgraph
rm *.bam

##### SA2KO IP
samtools merge \
GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_20221118_B3S2_cutadapt.uniq.bam
samtools sort GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.bam -o GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.sorted.bam

${bedtools} genomecov -ibam GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.sorted.bam -bg > GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.bedgraph
cat GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.bedgraph | \
    LANG=C sort -k1,1 -k2,2n > GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph
${bedgraphToBigwig} GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph ${GENOME_SIZE} GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.cov.bigwig

gzip GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.sorted.cov.bedgraph
rm GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL.bedgraph
rm *.bam

##### SA2KO input
samtools merge \
GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt.uniq.bam \
/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3S2_cutadapt/GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20221118_B3S2_cutadapt.uniq.bam
samtools sort GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.bam -o GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.sorted.bam

${bedtools} genomecov -ibam GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.sorted.bam -bg > GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.bedgraph
cat GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.bedgraph | \
    LANG=C sort -k1,1 -k2,2n > GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph
${bedgraphToBigwig} GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph ${GENOME_SIZE} GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.cov.bigwig

gzip GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.sorted.cov.bedgraph
rm GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_ALL.bedgraph
rm *.bam
