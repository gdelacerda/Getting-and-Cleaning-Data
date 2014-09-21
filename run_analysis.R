run_analysis<-function(trainSetFile,testSetFile,featuresFile,activitylablesFile,trainActivitiesFile,testActivitiesFile,subjectTrainFile,subjectTestFile){

##loads and merged train and test data sets
mergedData<-merge(trainSetFile,testSetFile)

##get activity labels
activityLabels<-read.table(activitylablesFile,as.is=TRUE)

##merges train and test activity data and labels it with activity name
dataActivities<-namingActivities(activityLabels,trainActivitiesFile,testActivitiesFile)

##reading train and test subject data
subjectTrain<-read.table(subjectTrainFile,as.is=TRUE)
subjectTest<-read.table(subjectTestFile,as.is=TRUE)

if(ncol(dataTrain)!=ncol(dataTest)){
stop("subject Train Data and Test Data do not have same columns, cannot merge", call. = TRUE, domain = NULL)
gettermessage()
}

##vertical (row) merge train and test subjects
subjects<-rbind(subjectTrain,subjectTest)

subjectIDs<-levels(as.factor(subject[,1]))

##labelled DataSet using setVariableNamestoData
labelledData<-setVariableNamestoData(mergedData,featuresFile)

##getting the variables of mean and Stdev
meanAndStdev<-extractMeanStDev(labelledData)

##add subject and Activity Name to the labelledData
labelledData$Subject<-subjects[,1]
labelledData$Activity<-dataActivities

##create an empty df which will contain all the averages
averagesDF<-data.frame()

##vector with subject/activity
subjectActiv<-character()

for(i in 1:length(subjectIDs)){

	subjectID<-subjectIDs[i]
	
	for(j in 1:length(activityLabels[,2])){
	
	activity<-activityLabels[j,2]
	
	sub<-subset(labelledData,labelledData$Subject==subjectID & labelledData$Activity==activity)
	##taking the average of each variable (561 variables)
	average<-colMeans(sub[,1:561])
	averagesDF<-rbind(averagesDF,average)
	s<-paste(subjectID,"/",activity)
	subjectActiv<-c(subjectActiv,s)
	
	}	
}

##label average data with features
averagesDF<-setVariableNamestoData(averagesDF,featuresFile)
averagesDF$Subject_Activity<-subjectActiv

return(averagesDF)

}

