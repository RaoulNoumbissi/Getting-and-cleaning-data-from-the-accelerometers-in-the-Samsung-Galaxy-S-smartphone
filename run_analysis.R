#import features.txt file to determine which columns  to use in the data set
features<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", 
                     sep ="", header = FALSE, dec =".")
#Only retain features that contain mean() or std() values. We get 66 out of the initial 561 features.
used_features<-grep("mean+\\()|std+\\()",as.character(features[,2]),value=TRUE)

##-------------------------------------####-------------------------------------#####--------------------------
##-------------------------------------####-------------------------------------#####--------------------------

#import from local computer text files X_train.txt, Y_train.txt, X_test.txt, Y_test.txt using function read.tabe()

# import training set
X_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", 
                        sep ="", header = FALSE, dec =".")
colnames(X_train)<-features[,2]
y_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", 
                    sep ="", header = FALSE, dec =".")
colnames(y_train)<-("Label")


#import test set
X_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", 
                    sep ="", header = FALSE, dec =".")
colnames(X_test)<-features[,2]
y_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", 
                   sep ="", header = FALSE, dec =".")
colnames(y_test)<-("Label")

#The new training and test set containing only the required columns
new_X_train<-X_train[,used_features]
new_X_test<-X_test[,used_features]

# create the final desired data set
smartphone_features<-rbind(new_X_train,new_X_test)
smartphone_label<-rbind(y_train,y_test)

#replace (1,2,3,4,5,6) with descriptive words (Walking,Walking_upstairs,Walking_Downstairs,Sitting,Standing,Laying) in the label.
descriptive_smartphone_label<-rep(0,length(smartphone_label))
descriptive_smartphone_label[smartphone_label==1]<-"WALKING"
descriptive_smartphone_label[smartphone_label==2]<-"WALKING_UPSTAIRS"
descriptive_smartphone_label[smartphone_label==3]<-"WALKING_DOWNSTAIRS"
descriptive_smartphone_label[smartphone_label==4]<-"SITTING"
descriptive_smartphone_label[smartphone_label==5]<-"STANDING"
descriptive_smartphone_label[smartphone_label==6]<-"LAYING"

descriptive_smartphone_label<-as.factor(descriptive_smartphone_label)
descriptive_smartphone_label<-data.frame(descriptive_smartphone_label)
colnames(descriptive_smartphone_label)<-"Activity"

# Here is our desired dataset
smartphone_dataset<- cbind(smartphone_features,descriptive_smartphone_label)

##-------------------------------------####-------------------------------------#####--------------------------
##-------------------------------------####-------------------------------------#####--------------------------


#here, row bind the subject training set and subject test set from the subject_train.txt and subject_test.txt files into a data frame called subject. 
subject_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", 
                                     sep ="", header = FALSE, dec =".")
subject_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", 
                          sep ="", header = FALSE, dec =".")
subject<-rbind(subject_train,subject_test)
colnames(subject)<-"subject"

#Activity<- descriptive_smartphone_label[1:7352,1]
.
# the the new smartphone dataset is.
new_smartphone_dataset<- cbind(subject,smartphone_dataset)


#Finally the aggregate function allows us to find the mean of all variables for each subject and for each activity
by_Subject_by_Activity<-aggregate(new_smartphone_dataset[, 2:67], list(new_smartphone_dataset$subject,new_smartphone_dataset$Activity), mean)
