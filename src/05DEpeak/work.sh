grep chr ../04count/All_WT_KO_B1B2B3_merged_peaks_count.txt|awk 'BEGIN{print "Peak\tSA2WT_B1\tSA2WT_B2\tSA2WT_B3\tSA2KO_B1\tSA2KO_B2\tSA2KO_B3"}{print $2":"$3"-"$4"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12}' >All_WT_KO_B1B2B3_merged_peaks_count.txt

grep chr ../04count/All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt|awk 'BEGIN{print "Peak\tSA2WT_B1S2\tSA2WT_B2S2\tSA2WT_B3\tSA2KO_B1S2\tSA2KO_B2S2\tSA2KO_B3"}{print $2":"$3"-"$4"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12}' >All_WT_KO_B1S2B2S2B3_merged_peaks_count.txt
