#07.05.2014_Assignment done for the Coursera course "Getting and Cleaning Data" of "Data Science" Specialization track.
##Loading the plyr library. Will be needed at the end for ddply!!!
library(plyr)
###Loading list of variable names. It will be used for selecting only standard deviation and mean measurements
variablenames <- read.table("features.txt")
###Selecting needed variables, which have mean and standard deviation values
vector=rep("NULL",nrow(variablenames))
###Creating also an empty vector. It will be used for assigning NULL for values which should not be loaded. Otherwise problems!!!
names=character()
###Creating a new character vector with variable names
varnameschar=as.character(variablenames$V2)
###going with a loop over all the rows
for(i in 1:nrow(variablenames)){
        names[i]=varnameschar[i]
        if(grepl("mean\\()",varnameschar[i]) | grepl("std\\()",varnameschar[i])){
                vector[i]="numeric"
        }
}
###Loading test data. Column names changed for subject and activity data
X_test <- read.table("X_test.txt",colClasses=vector,col.names=names,check.names="false")
y_test <- read.table("y_test.txt")
colnames(y_test)<-"testtype"
subject_test <- read.table("subject_test.txt")
colnames(subject_test)<-"subject"
###Building the new test data from the changed input
testdata<-cbind(subject_test,y_test,X_test)
###Loading training data. Column names changed for subject and activity data
X_train <- read.table("X_train.txt",colClasses=vector,col.names=names,check.names="false")
y_train <- read.table("y_train.txt")
colnames(y_train)<-"testtype"
subject_train <- read.table("subject_train.txt")
colnames(subject_train)<-"subject"
###Building the new test data using column bind function
training<-cbind(subject_train,y_train,X_train)
###All data will be combined together
all_data<-rbind(testdata,training)
###Adding activity names by merging activity names using testtype column
activities <- read.table("activity_labels.txt")
colnames(activities)[1]<-"testtype"
colnames(activities)[2]<-"activity"
alldatawa<-merge(all_data,activities,by="testtype")
###Removing the codes of activities
myvars <- names(alldatawa) %in% c("testtype")
alldatawithactivies <- alldatawa[!myvars]

##Creating tidy dataset with averages
titydataaverage=ddply(alldatawithactivies, .(subject,activity), numcolwise(mean))
###Writting the final table. Exporting the data separated with tab
write.table(titydataaverage, file="./tity.txt", sep="\t", row.names=FALSE)
