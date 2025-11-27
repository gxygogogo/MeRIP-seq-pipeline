####################################################################
TABLE="/opt/basic/_py/bin/python /opt/basic/console/table_util.py"
TRACK="/opt/basic/_py/bin/python /opt/basic/console/track_util.py"
GENOME="hg38"
FOLDER="GM12878 MeRIP-seq"

num=5307
cat list.txt | while read PREFIX
do
#File=/data2/TangLabData/ProcessedData/MeRIP-seq/${PREFIX}/${PREFIX}.bed12
File=/data/xinyu/CohesinProject/MeRIP-seq/01mapping/${PREFIX}/${PREFIX}.bed12
${TABLE} create ${GENOME} -l "${FOLDER}" "${PREFIX}.bed12"
TABLE_ID=${num}
${TRACK} bed_rnaseq ${TABLE_ID} ${File} --split
num=$(( $num + 1 ))
done

