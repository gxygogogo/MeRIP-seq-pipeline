# bam to bigwig coverage
#../01mapping/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt/GM12878_MeRIPseq_ChrRNA_20220725_B1S2_cutadapt.uniq.bam
for sample in GM12878_MeRIPseq_ChrRNA_20220725_B1_cutadapt GM12878_MeRIPseq_ChrRNA_20220815_B2_cutadapt GM12878_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt GM12878_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220725_B1_cutadapt GM12878_SA2KOA13_MeRIPseq_ChrRNA_20220815_B2_cutadapt GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220725_B1_cutadapt GM12878_SA2KOA13_MeRIPseq_ChrRNA_input_20220815_B2_cutadapt
do
#        sample=`basename ${i%%.uniq.bam}`
        echo -e "${sample}"
#        samtools index $i
        bamCoverage -b ../01mapping/${sample}/${sample}.uniq.bam -e 150 --normalizeUsing RPKM -o ${sample}.cov_nor.bw
#        bedtools bamtobed -i $i >${sample}.rmdup.bed
done
