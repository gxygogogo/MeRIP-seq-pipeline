#!/bin/bash
#PBS -N GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt
#PBS -l nodes=node03:ppn=10
#PBS -l walltime=100000:00:00
#PBS -j n
#PBS -q batch
#PBS -e ${PBS_JOBNAME}.err
#PBS -o ${PBS_JOBNAME}.out

cd $PBS_O_WORKDIR

inputFQ1=GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_R1.fq.gz
inputFQ2=removeGGG_R2.fq.gz
PREFIX=GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2_cutadapt
##############################################
## cutadapt
cutadapt=/usr/bin/cutadapt
R1seq="CCCAGATCGGAAGAGC"
R2seq="AGATCGGAAGAGC"

outputFQ1=R1.fq.gz
outputFQ2=R2.fq.gz

${cutadapt} -b ${R1seq} -o ${outputFQ1} --info-file FQ1infor.txt ${inputFQ1} > FQ1cutadapt.log

${cutadapt} -b ${R2seq} -o ${outputFQ2} --info-file FQ2infor.txt ${inputFQ2} > FQ2cutadapt.log


##############################################
## Tools
hisat2=/data/public/software/hisat2-2.1.0/hisat2
samtools=/data/public/software/samtools-1.3.1/samtools
bedtools=/data/public/software/bedtools.2.25.0/bin/bedtools
bedGraphToBigWig=/home/yuhan/Software/others/bin/bedGraphToBigWig
cpu_num=10

## GENOME information
GENOME=/data/public/refGenome/hisat2_index/hg38/hg38
GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
GENOME_ANNOTATION=/data1/tang/3D_evolution/primates_annotation/hg38/Homo_sapiens.GRCh38.97_withchr.gtf

##############################################
## R1 and R2
fastq_1=R1.fq.gz
fastq_2=R2.fq.gz

## mapping
${hisat2} -x ${GENOME} -1 ${fastq_1} -2 ${fastq_2} -p ${cpu_num} -S ${PREFIX}.sam --rna-strandness RF

## sam2bam
${samtools} view -b -o ${PREFIX}.bam -@ ${cpu_num} - < ${PREFIX}.sam

## sort bam by coordinate
${samtools} sort --threads ${cpu_num} -o ${PREFIX}.sorted.bam ${PREFIX}.bam

## unique map
${samtools} view -b -o ${PREFIX}.uniq.bam -q 20 -@ ${cpu_num} ${PREFIX}.sorted.bam
${samtools} index ${PREFIX}.uniq.bam

