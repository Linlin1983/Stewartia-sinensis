setwd("D:/1科研/郝艳林/new/31331_newgene/TAI/")

library(myTAI)

#Theaceae
sps_data <- read.table('CSA_eight_tissues_expression.txt',sep = '\t',header = T)
PlotSignature(sps_data,
              measure = "TAI" )

PlotMeans(sps_data, Groups = list((1:4)))

