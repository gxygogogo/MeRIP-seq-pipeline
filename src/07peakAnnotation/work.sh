# get peak to nearest gene
awk -F"\t" 'NR>1{if($10>0){print $16"\t"$2":"$3-1"-"$4"\t"$10"\t"$8}else{print $16"\t"$2":"$3-1"-"$4"\t"(-1)*$10"\t"$8}}' All_peaks.annotated.txt|sort -k1,1 -k3,3n|awk 'BEGIN{print "Gene\tPeak\tDistToTSS\tType"}!a[$1]++' >All_peakTogene.txt

awk -F"\t" 'BEGIN{print "Peak\tGene\tDistToTSS\tType"}NR>1{print $2":"$3-1"-"$4"\t"$16"\t"$10"\t"$8}' All_peaks.annotated.txt >All_peakTogene2.txt
