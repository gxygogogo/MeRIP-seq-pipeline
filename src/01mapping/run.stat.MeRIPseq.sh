#!/bin/bash

PREFIX=${1}
GENOME_ASSEMBLY_NAME=${2}

#output=/data2/TangLabData/ProcessedData/MeRIP-seq/${PREFIX}
output=/data/xinyu/CohesinProject/MeRIP-seq/merge/01mapping/${PREFIX}

if [ "${GENOME_ASSEMBLY_NAME}" == "panTro5" ];
then
GENOME=/data/public/refGenome/hisat2_index/panTro5/panTro5
GENOME_SIZE=/data/public/refGenome/bwa_index/panTro5/panTro5.chrom.sizes
GENOME_ANNOTATION=/data1/tang/3D_evolution/primates_annotation/panTro5/Pan_troglodytes.Pan_tro_3.0.97.chr.gtf

elif [ "${GENOME_ASSEMBLY_NAME}" == "gorGor4" ];
then
GENOME=/data/public/refGenome/hisat2_index/gorGor4/gorGor4
GENOME_SIZE=/data/public/refGenome/bwa_index/gorGor4/gorGor4.chrom.sizes
GENOME_ANNOTATION=/data1/tang/3D_evolution/primates_annotation/gorGor4/Gorilla_gorilla.gorGor4.97.chr.gtf

elif [ "${GENOME_ASSEMBLY_NAME}" == "rheMac8" ];
then
GENOME=/data/public/refGenome/hisat2_index/rheMac8/rheMac8
GENOME_SIZE=/data/public/refGenome/bwa_index/rheMac8/rheMac8.chrom.sizes
GENOME_ANNOTATION=/data1/tang/3D_evolution/primates_annotation/rheMac8/Macaca_mulatta.Mmul_8.0.1.97.chr.gtf

elif [ "${GENOME_ASSEMBLY_NAME}" == "hg38" ];
then
GENOME=/data/public/refGenome/hisat2_index/hg38/hg38
GENOME_SIZE=/data/public/refGenome/bwa_index/hg38/ChromInfo.txt
GENOME_ANNOTATION=/data1/tang/3D_evolution/primates_annotation/hg38/Homo_sapiens.GRCh38.97_withchr.gtf

elif [ "${GENOME_ASSEMBLY_NAME}" == "mm10" ];
then
GENOME=/data/public/refGenome/hisat2_index/mm10/genome
GENOME_SIZE=/data/public/refGenome/bwa_index/mm10/mm10.chrom.sizes
GENOME_ANNOTATION=/data/public/Gene.annotation/mm10/Mus_musculus.GRCm38.98.gtf
fi

samtools=/data/public/software/samtools-1.3.1/samtools
gtfToGenePred=/data/public/software/Util.UCSC.exe/gtfToGenePred
genePredToBed=/data/public/software/Util.UCSC.exe/genePredToBed

echo ${PREFIX};
echo -e "\nreads";
#reads=`zcat /data2/TangLabData/CleanData/MeRIP-seq/${PREFIX}/${PREFIX}*_*1.*f*q.gz |wc -l`
reads=`zcat R1.fq.gz |wc -l`
echo $(($reads/2))

PREFIX=${output}/${PREFIX}

for f in ${PREFIX}.*.bam ;do file=${f/.bam/};${samtools} flagstat $f >$file.flagstat; done

echo -e "\n\nsorted\tnodup";
for type in sorted uniq;do  grep "properly paired" ${PREFIX}.$type.flagstat|sed "s/ .*//";done|sed ':a;N;s/\n/\t/;ta;'

#${gtfToGenePred} ${GENOME_ANNOTATION} ${PREFIX}.genome.genePhred
#${genePredToBed} ${PREFIX}.genome.genePhred ${PREFIX}.genome.bed12
#rm -f ${PREFIX}.genome.genePhred

##library type
#infer_experiment.py -r ${PREFIX}.genome.bed12 -i ${PREFIX}.bam -s 2000000 > ${PREFIX}.rseqc
#echo -e "\n\nlibrary type"
#echo -e "failed to detemine\t1++,1--\t1+-,1-+"
#grep "Fraction" ${PREFIX}.rseqc |sed "s/.*: //g" |sed ':a;N;s/\n/\t/;ta;'
#rm -f ${PREFIX}.genome.bed12

#echo -e "\n\ncount\tcount>0\tcount>10\tRiG (Reads in Genes)\tRiEG (Reads in Expressed Genes)"
#x=`awk '($1!~/^_/){print}' ${PREFIX}.count | wc -l`
#y=`awk '($1!~/^_/)&&($2>0){print}' ${PREFIX}.count | wc -l`
#z=`awk '($1!~/^_/)&&($2>10){print}' ${PREFIX}.count |wc -l`

#b=`awk '($1!~/^_/)&&($2>0){ n++;s=s+$2}END{print s}' ${PREFIX}.count`
#c=`awk '($1!~/^_/)&&($2>10){n++;s=s+$2}END{print s}' ${PREFIX}.count`

#echo -e "$x\t$y\t$z\t$b\t$c";

echo "###DONE"

