library(rGREAT)
library(stringr)

##########################################################################################################################
data <- read.csv("/public1/xinyu/CohesinProject/MeRIP-seq/m6A_peak/SA2KO_vs_SA2WT.DESeq2.DEs.csv")
head(data)
#                         X   baseMean log2FoldChange     lfcSE       stat
#1 chr7:120273683-120275492 12338.8841      -7.255232 0.5340351 -13.585685
#2  chr18:72750151-72750676  1373.4219       8.639296 0.7216504  11.971581
#3 chr7:158420097-158421440  1911.9096       7.116831 0.6062906  11.738316
table(data$sig)
#Down   Up
# 314 1475

#i=1
#i <- "Up"
i <- "Down"
peak <- data[data$sig==i,]$X
chr <- sapply(str_split(peak,'_'),'[',1)
start <- as.numeric(sapply(str_split(peak,'_'),'[',2))
end <- as.numeric(sapply(str_split(peak,'_'),'[',3))
bed <- data.frame(chr,start,end)
head(bed)
#    chr     start       end
#1  chr2 120938451 120939841
#2 chr19  43519469  43521464
#3  chr6 127364856 127365799

# submit GREAT jobs
job <- submitGreatJob(
    gr                    = bed,
    bg                    = NULL,
    species               = "hg38",
    includeCuratedRegDoms = TRUE,
    rule                  = "basalPlusExt",
    adv_upstream          = 5.0,
    adv_downstream        = 1.0,
    adv_span              = 1000.0,
    adv_twoDistance       = 1000.0,
    adv_oneDistance       = 1000.0,
    request_interval = 300,
    max_tries = 10,
    version = "default",
    base_url = "http://great.stanford.edu/public/cgi-bin"
  )

# get GREAT enriched results
#tb = getEnrichmentTables(job, category = c("GO"), download_by = "tsv");
tb <- getEnrichmentTables(job, category = c("GO"))
## [1] "GO Molecular Function" "GO Biological Process" "GO Cellular Component"

GBP <- tb[["GO Biological Process"]]
#head(GBP[order(GBP[,"Binom_Adjp_BH"]),1:5]);
write.csv(GBP,paste0("GREAT_GO_enrichment_",i,".csv"))

# plot region gene association
pdf(paste0("GREAT_plotRegionGeneAssociationGraphs_",i,".pdf"),height=5,width=15)
res <- plotRegionGeneAssociationGraphs(job)
dev.off()

write.csv(res,paste0("GREAT_plotRegionGeneAssociationGraphs_",i,".csv"))

