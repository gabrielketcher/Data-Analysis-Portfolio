#Import the data first and then load the library
suppressWarnings(RNGversion("3.5.3"))
library(cluster)
#Filter the data and select columns
myData1 <- myData[myData$City == 'SAN DIEGO' & myData$Month %in% c(1,2),]
myData2 <- myData1[, -c(1, 2, 3, 6, 8, 9)]
#Add weekend column
myData2$Weekend<- ifelse(myData2$Weekday %in% c(1:5), 0, 1)
#Delete weekday column
myData2<-myData2[, -1]
#Determine similarity using matching coefficients method
d<- dist(myData2, method = "binary")
#Perform clustering
aResult <- agnes(d, diss = TRUE, method = "ward")
aResult
#Plot dendrogram
plot(aResult)
#Determine number of clusters
aClusters <- cutree(aResult, k = 4)
#Append cluster membership to original data frame
myData2<- data.frame(myData2, aClusters)
myData2$aClusters<-as.factor(myData2$aClusters)
View(myData2)
#View summaries of clusters
summary(subset(myData2, aClusters == 1))
summary(subset(myData2, aClusters == 2))
summary(subset(myData2, aClusters == 3))
summary(subset(myData2, aClusters == 4))


#Gower’s coefficient R code:
SuppressWarnings(RNGversion("3.5.3"))
library(cluster)
myData1 <- myData[myData$City == 'SAN DIEGO' & myData$Month %in% c(1,2),]
myData2 <- myData1[, -c(1, 2, 3, 6, 8, 9)]
myData2$Weekend<- ifelse(myData2$Weekday %in% c(1:5), 0, 1)
myData2<-myData2[, -1]
#Uses Gower’s coefficient
d<- daisy(myData2, metric = "gower")
aResult <- agnes(d, diss = TRUE, method = "ward")
aResult
plot(aResult)
aClusters <- cutree(aResult, k = 4)
myData2<- data.frame(myData2, aClusters)
myData2$aClusters<-as.factor(myData2$aClusters)
View(myData2)
summary(subset(myData2, aClusters == 1))
summary(subset(myData2, aClusters == 2))
summary(subset(myData2, aClusters == 3))
summary(subset(myData2, aClusters == 4))

#3 clusters code:
suppressWarnings(RNGversion("3.5.3"))
library(cluster)
myData1 <- myData[myData$City == 'SAN DIEGO' & myData$Month %in% c(1,2),]
myData2 <- myData1[, -c(1, 2, 3, 6, 8, 9)]
myData2$Weekend<- ifelse(myData2$Weekday %in% c(1:5), 0, 1)
myData2<-myData2[, -1]
d<- dist(myData2, method = "binary")
aResult <- agnes(d, diss = TRUE, method = "ward")
aResult
plot(aResult)
#Uses 3 clusters
aClusters <- cutree(aResult, k = 3)
myData2<- data.frame(myData2, aClusters)
myData2$aClusters<-as.factor(myData2$aClusters)
View(myData2)
#Shows summaries of the 3 clusters
summary(subset(myData2, aClusters == 1))
summary(subset(myData2, aClusters == 2))
summary(subset(myData2, aClusters == 3))
