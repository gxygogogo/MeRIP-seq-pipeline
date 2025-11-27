cut -d"," -f 7 GREAT_plotRegionGeneAssociationGraphs_Up.csv |egrep -v "gene|NA"|sort -u|sed 's/"//g' >DE_peak_up_gene.txt
cut -d"," -f 7 GREAT_plotRegionGeneAssociationGraphs_Down.csv |egrep -v "gene|NA"|sort -u|sed 's/"//g' >DE_peak_down_gene.txt

