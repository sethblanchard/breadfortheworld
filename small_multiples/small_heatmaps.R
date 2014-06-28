#!/usr/bin/env Rscript

master <- read.csv("dropped_data.csv")
heat <- function (country,data){
	tmp <- data[data$Country.Name == country,]

	row.names(tmp) <- tmp$Indicator.Name

	drops <- c("Country.Name","Indicator.Name")
	tmp <- subset(tmp, select = -c(Country.Name,Indicator.Name) )
	tm <- data.matrix(tmp)
	# hm1 <- heatmap(tm)

	# pdf("plots.pdf", width=1, height=1)
	par(mar=c(2,2,2,2))
	image(tm,col="black",axes=FALSE)
	mtext(country,side=1)


	# heatmap(t, Rowv=NA, Colv=NA, col = 'black', scale="column")
	# dev.off()
}

# create a layout to draw 4 heatmaps, 2 will be big and 2 will be small
nf <- layout(matrix(seq(1,20,by=1),5,4, byrow=T), widths=c(1,1), heights=c(1,1), respect=T)
# check how the layout looks
layout.show(nf)
names <- master$Country.Name[1:20]
for (n in names){
	heat(n,master)
}
