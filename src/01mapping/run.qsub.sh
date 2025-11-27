#!/bin/bash

for prefix in GM12878_MeRIPseq_ChrRNA_20220725_B1S2 GM12878_MeRIPseq_ChrRNA_input_20220725_B1S2 GM12878_MeRIPseq_ChrRNA_20220815_B2S2 GM12878_MeRIPseq_ChrRNA_input_20220815_B2S2 GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1S2 GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1S2 GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2S2 GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2S2
do
PREFIX=${prefix}_cutadapt

#cd /data2/TangLabData/ProcessedData/MeRIP-seq
cd /public1/xinyu/CohesinProject/MeRIP-seq/01mapping
mkdir ${PREFIX}
cd ${PREFIX}

# merge B1 and B1S2 data
zcat /data2/TangLabData/RawData/MeRIP-seq/${prefix%%S2}/${prefix%%S2}_R1.fq.gz /data2/TangLabData/RawData/MeRIP-seq/${prefix}/${prefix}_R1.fq.gz | gzip - > ${prefix}_R1.fq.gz
zcat /data2/TangLabData/RawData/MeRIP-seq/${prefix%%S2}/${prefix%%S2}_R2.fq.gz /data2/TangLabData/RawData/MeRIP-seq/${prefix}/${prefix}_R2.fq.gz | gzip - > ${prefix}_R2.fq.gz

zcat ${prefix}_R2.fq.gz | awk '{if(NR%4==2 || NR%4==0) print substr($0,4);else print $0;}' | gzip - > removeGGG_R2.fq.gz

echo "sh /public1/xinyu/CohesinProject/MeRIP-seq/01mapping/run.mapping_bam.sh ${prefix} ${prefix}_R1.fq.gz removeGGG_R2.fq.gz" | qsub -d ./ -N ${PREFIX} -l nodes=node02:ppn=4

done