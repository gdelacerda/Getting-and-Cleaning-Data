namingActivities<-function(activitylables,trainActivityFile,testActivityFile){

##reading the activities  of train and test data
act_Train<-read.table(trainActivityFile,as.is=TRUE)
act_Test<-read.table(testActivityFile,as.is=TRUE)

##using qdapTools library

library("qdapTools")

##labelling the activities with the activityLables names

trainActivNames<-lookup(act_Train,activitylables)
testActNames<-lookup(act_Test,activitylables)

activityNames<-c(trainActivNames,testActNames)

return(activityNames)
}