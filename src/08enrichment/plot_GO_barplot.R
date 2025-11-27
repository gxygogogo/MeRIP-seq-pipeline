library(ggplot2)
library(stringr)

data <- read.csv("GREAT_GO_enrichment_Up.csv")
head(data)
#  X         ID
#1 1 GO:0060715
#2 2 GO:0035773
#3 3 GO:0090084
#4 4 GO:0090083
#5 5 GO:0060710
#6 6 GO:0060717                                                                   name
#1 syncytiotrophoblast cell differentiation involved in labyrinthine layer development
#2                 insulin secretion involved in cellular response to glucose stimulus
#3                                      negative regulation of inclusion body assembly
#4                                               regulation of inclusion body assembly
#5                                                             chorio-allantoic fusion
#6                                                                 chorion development
data$name <- factor(data$name)

##"#D52126" "#88CCEE" "#FEE52C"
pdf("GREAT_GO_enrichment_Up_barplot.pdf",height=6,width=8.6)
ggplot(data[1:20,],aes(x=reorder(name,-X), y=-log10(Binom_Raw_PValue),fill=-log10(Binom_Raw_PValue))) + 
  geom_bar(stat = "identity") + theme_bw(base_size = 16) + coord_flip() +
  scale_fill_gradientn(colours=c("#fcbba1","#D52126")) + xlab("GO Biological Process") +
  scale_x_discrete(labels=function(x) str_wrap(x, width=45)) + 
  labs(fill="-Log10(Pvalue)")
dev.off()

data <- read.csv("GREAT_GO_enrichment_Down.csv")
data$name <- factor(data$name)

pdf("GREAT_GO_enrichment_Down_barplot.pdf",height=6,width=9)
ggplot(data[1:20,],aes(x=reorder(name,-X), y=-log10(Binom_Raw_PValue),fill=-log10(Binom_Raw_PValue))) + 
  geom_bar(stat = "identity") + theme_bw(base_size = 16) + coord_flip() +
  scale_fill_gradientn(colours=c("#c7e9c0","#117733")) + xlab("GO Biological Process") +  
  scale_x_discrete(labels=function(x) str_wrap(x, width=45)) + 
  labs(fill="-Log10(Pvalue)")
dev.off()
