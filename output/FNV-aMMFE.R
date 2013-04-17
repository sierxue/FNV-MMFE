#################
# R code for analyzing output and plot figures
# v1.0 (organized on 2013-04-17)
#################

#NEED TO FIRST SET R WORKING DIRECTORY TO WHERE THE FILES ARE LOCATED!!!
setwd("/Users/buxx/Desktop/test/")

#read the output file
data <- read.table("FNV-aMMFE.txt", header=TRUE)

#percentage difference in expected profits of the Multi- and Single-ordering models



#prepare data for Figure 1
subtotal_stdev <- aggregate(data[c('deltaPi', 'stdev')], by=list(data$stdev), FUN=mean)
subtotal_T <- aggregate(data[c('deltaPi', 'T')], by=list(data$T), FUN=mean)
pdf('Figure1.pdf', width = 12, height = 5)
par(oma=c(0,0,2,0))
par(mfrow=c(1,3))


yrange = range(subtotal_stdev$deltaPi, subtotal_T$deltaPi, subtotal_lambda$deltaPi)

xrange = range(subtotal_stdev$stdev)
plot(xrange, yrange, type="n", xlab=expression(sigma), ylab=expression(paste(Delta[Pi], " (%)")) , xaxt="n")
lines(subtotal_stdev$stdev, subtotal_stdev$deltaPi, type="l") 
plot(xrange, yrange, type="n", xlab="T", ylab="", xaxt="n")
axis(side=1, at=seq(0.1,0.9,0.1), labels=seq(0.1,0.9,0.1))


xrange = range(subtotal_lambda$lambda)
plot(xrange, yrange, type="n", xlab=expression(lambda), ylab="", xaxt="n")
axis(side=1, at=seq(0.02,0.2,0.02), labels=seq(0.02,0.2,0.02))
title(main="Figure 1. Comparison of the Expected Profits Between the Multiordering and the Static Single-Ordering Strategies: a-MMFE", outer=T)

dev.off()