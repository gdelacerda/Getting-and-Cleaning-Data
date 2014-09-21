setVariableNamestoData<-function(dataSet,variableNameFile){

##reading features/variable file
featureNames<-read.table(variableNameFile,as.is=TRUE)[,2]

##checking the number of features which has to be same
##number of columns in the Train and Tests Set
length(featureNames)

if(length(featureNames)!=ncol(dataSet)){
stop("The number of features is not equal to the data set columns", call. = TRUE, domain = NULL)
gettermessage()
}

##assigning variable names to the data
colnames(dataSet)<-featureNames

return(dataSet)
}