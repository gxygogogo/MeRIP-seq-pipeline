#!/bin/bash
################################################################################################################################################
## each replicates
chrSize=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt

PREFIX=GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt
inputDir=/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam

PREFIX=GM12878_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt
inputDir=/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam

PREFIX=GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt
inputDir=/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam

PREFIX=GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2_cutadapt
inputDir=/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${chrSize} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam

################################################################################################################################################
## merge replicates
GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
PREFIX=GM12878_MeRIPseq_ChrRNA_ALL
for index in `awk '($1!~/M/)&&($1!~/_/){print $1}' ${GENOME_SIZE}`
do
    echo "Processing chr${index}..."
    samtools view -b -o ${PREFIX}.flag64_first.bam -f 64 ${PREFIX}.bam ${index}
    samtools view -b -o ${PREFIX}.flag128_second.bam -f 128 ${PREFIX}.bam ${index}
    bedtools bamtobed -bed12 -i ${PREFIX}.flag128_second.bam > ${PREFIX}.tmp1.bed12
    bedtools bamtobed -bed12 -i ${PREFIX}.flag64_first.bam | perl -lane 'if( $F[5] eq "+" ){ $F[5] = "-"; print join( "\t", @F ) } else { $F[5] = "+"; print join( "\t", @F ) }' >> ${PREFIX}.tmp1.bed12

    cat ${PREFIX}.tmp1.bed12 | LANG=C sort -k1,1 -k2,2n >> ${PREFIX}.bed12
done

GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
inputDir=/public1/xinyu/CohesinProject/MeRIP-seq
PREFIX=GM12878_MeRIPseq_ChrRNA_ALL
zcat ${inputDir}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${GENOME_SIZE} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${GENOME_SIZE} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam

GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
PREFIX=GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL
for index in `awk '($1!~/M/)&&($1!~/_/){print $1}' ${GENOME_SIZE}`
do
    echo "Processing chr${index}..."
    samtools view -b -o ${PREFIX}.flag64_first.bam -f 64 ${PREFIX}.bam ${index}
    samtools view -b -o ${PREFIX}.flag128_second.bam -f 128 ${PREFIX}.bam ${index}
    bedtools bamtobed -bed12 -i ${PREFIX}.flag128_second.bam > ${PREFIX}.tmp2.bed12
    bedtools bamtobed -bed12 -i ${PREFIX}.flag64_first.bam | perl -lane 'if( $F[5] eq "+" ){ $F[5] = "-"; print join( "\t", @F ) } else { $F[5] = "+"; print join( "\t", @F ) }' >> ${PREFIX}.tmp2.bed12

    cat ${PREFIX}.tmp2.bed12 | LANG=C sort -k1,1 -k2,2n >> ${PREFIX}.bed12
done

GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
inputDir=/public1/xinyu/CohesinProject/MeRIP-seq
PREFIX=GM12878_SA2KOA13_MeRIPseq_ChrRNA_ALL
zcat ${inputDir}/${PREFIX}.bed12.gz | awk '($6=="+"){print }' | bedToBam -bed12 -i - -g ${GENOME_SIZE} > ${PREFIX}.first.bam
zcat ${inputDir}/${PREFIX}.bed12.gz | awk '($6=="-"){print }' | bedToBam -bed12 -i - -g ${GENOME_SIZE} > ${PREFIX}.second.bam
samtools index ${PREFIX}.first.bam
samtools index ${PREFIX}.second.bam
bamCoverage -bs 1 -p 15 -b ${PREFIX}.first.bam -o ${PREFIX}.first.bigwig
bamCoverage -bs 1 -p 15 -b ${PREFIX}.second.bam -o ${PREFIX}.second.bigwig
rm -f ${PREFIX}.first.bam ${PREFIX}.second.bam
