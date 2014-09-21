
extractMeanStDev<-function(dataSet){


##reading features/variable names
featureNames<-read.table("features.txt",as.is=TRUE)[,2]

##checking the number of features which has to be same
##number of columns in the Train and Tests Set
length(featureNames)

##assigning variable names to the data
colnames(mergedData)<-featureNames

##extracting the column names representing mean measurements
means<-grep("-mean",featureNames)

##extracting the colummn names representing standard deviation measurements
stdev<-grep("-std",featureNames)

##merging both
meanAndStdev<-c(means,stdev)

##extracting the columns with mean and std measurements
dataMeanStdev<-mergedData[,meanAndStdev]

return(dataMeanStdev)
}