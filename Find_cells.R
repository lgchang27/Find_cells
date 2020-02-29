#Programmer: Liguo Zhang (lgchang27@gmail.com)
#R script, Nov 19,2017
#Copyright reserved, research use only, contact Liguo Zhang for permession for commercial use.

REF1 <- read.table(textConnection(gsub(",", "\t", readLines("PATH/ref-1stMicroscopy.txt"))))

REF2 <- read.table(textConnection(gsub(",", "\t", readLines("PATH/ref-2ndMicroscopy.txt"))))

centroid1x=mean(REF1$V2[1:3])
centroid1y=mean(REF1$V3[1:3])

centroid2x=mean(REF2$V2[1:3])
centroid2y=mean(REF2$V3[1:3])

#########solve for sin and cos
## x cos theta - y sin theta = x' 
## y cos theta + x sin theta = y'

A1 <- matrix (data=c(REF1$V2[1]-centroid1x, -REF1$V3[1]+centroid1y, REF1$V3[1]-centroid1y, REF1$V2[1]-centroid1x), nrow=2, ncol=2, byrow=TRUE)
B1 <- matrix (data=c(REF2$V2[1]-centroid2x, REF2$V3[1]-centroid2y),nrow=2, ncol=1, byrow=FALSE)
C1 <- solve(A1,B1)

A2 <- matrix (data=c(REF1$V2[2]-centroid1x, -REF1$V3[2]+centroid1y, REF1$V3[2]-centroid1y, REF1$V2[2]-centroid1x), nrow=2, ncol=2, byrow=TRUE)
B2 <- matrix (data=c(REF2$V2[2]-centroid2x, REF2$V3[2]-centroid2y),nrow=2, ncol=1, byrow=FALSE)
C2 <- solve(A2,B2)

A3 <- matrix (data=c(REF1$V2[3]-centroid1x, -REF1$V3[3]+centroid1y, REF1$V3[3]-centroid1y, REF1$V2[3]-centroid1x), nrow=2, ncol=2, byrow=TRUE)
B3 <- matrix (data=c(REF2$V2[3]-centroid2x, REF2$V3[3]-centroid2y),nrow=2, ncol=1, byrow=FALSE)
C3 <- solve(A3,B3)

cos_theta = mean (C1[1],C2[1],C3[1])
sin_theta = mean (C1[2],C2[2],C3[2])


pointlist1 <- read.table(textConnection(gsub(",", "\t", readLines("PATH/cells-1stMicroscopy.txt"))))

x2 =round((pointlist1$V2[]-centroid1x)*cos_theta-(pointlist1$V3[]-centroid1y)*sin_theta + centroid2x, 1)
y2 =round((pointlist1$V3[]-centroid1y)*cos_theta+(pointlist1$V2[]-centroid1x)*sin_theta + centroid2y,1)

pointlist2=data.frame(pointlist1$V1, x2, c(","), y2, c(","), pointlist1$V4)
write.table(pointlist2, "PATH/cells-2ndMicroscopy.txt", row.names=FALSE, col.names=FALSE, quote=FALSE)


