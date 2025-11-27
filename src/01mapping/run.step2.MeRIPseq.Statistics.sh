#!/bin/bash

#######################################################################################################################################
## MeRIPseq Statistics (Only this)

cat list.txt | while read PREFIX
do
cd /data/xinyu/CohesinProject/MeRIP-seq/01mapping/${PREFIX}
bash /data/xinyu/CohesinProject/MeRIP-seq/01mapping/run.stat.MeRIPseq.sh \
${PREFIX} \
hg38 \
> ${PREFIX}.stat
done
