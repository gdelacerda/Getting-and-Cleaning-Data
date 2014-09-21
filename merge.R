merge<-function(trainSet,testSet){


##loading training data
dataTrain<-read.table(file=trainSet,sep="")

##checking the dimension of dataTrain
dim(dataTrain)

##loading Testing set
dataTest<-read.table(file=testSet,sep="")

##checking the dimension in this set
dim(dataTest)

if(ncol(dataTrain)!=ncol(dataTest)){
stop("Train Data and Test Data do not have same number of variables, cannot merge", call. = TRUE, domain = NULL)
gettermessage()
}

##merging dataTrain and dataTest, this is a vertical merge.
##We know that the variables/columns in both sets are the same and
##follow the same order

mergedData<-rbind(dataTrain,dataTest)

##checking the dimension of mergedData, the number of rows
## should be  be equal to the size of dataTrain + dataTest
## and columns should be the equal to featureNames length

n<-nrow(mergedData)

if(n!=(ncol(dataTest)+ncol(dataTrain)){
stop("Merge not successful total merge rows not equal to the sum of two sets", call. = TRUE, domain = NULL)
gettermessage()
}


return(mergedData)

}