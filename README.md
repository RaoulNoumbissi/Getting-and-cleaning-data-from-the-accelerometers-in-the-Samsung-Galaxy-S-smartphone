# Getting-and-cleaning-data-from-the-accelerometers-in-the-Samsung-Galaxy-S-smartphone

The first step in cleanning our dataset is to import the text  file containing or describing  all the features in the dataset. There are a total of 561 features in the text file, but we only need those features that represent either the *mean* or *standard deviation*.

```{r cars}
features<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", 
                     sep ="", header = FALSE, dec =".")
```

To isolate the necessary features, which we save in a variable called *used_features*, we use the *grep()* function below. 
```{r cars}
used_features<-grep("mean+\\()|std+\\()",as.character(features[,2]),value=TRUE)
```
The data set in this study will contain 66 features that each describe *mean* or *std* values.

Now that the features have been determined, we import  text files *X_train.txt*, *y_train.txt*, *X_test.txt*, *y_test.txt* using function *read.tabe()*

The training set:
```{r cars}
X_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", 
                        sep ="", header = FALSE, dec =".")
colnames(X_train)<-features[,2]
y_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", 
                    sep ="", header = FALSE, dec =".")
colnames(y_train)<-("Label")

```

The test set:
```{r cars}
X_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", 
                    sep ="", header = FALSE, dec =".")
colnames(X_test)<-features[,2]
y_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", 
                   sep ="", header = FALSE, dec =".")
colnames(y_test)<-("Label")

```


We only require the used features in our training and test set:
```{r cars}
new_X_train<-X_train[,used_features]
new_X_test<-X_test[,used_features]

```

Now, we need to create the desired dataframe, with 66 features and the label, for a total of 67 columns and 10299 rows.To accomplish this, 

combine by row *X_train* and *X_test* using *rbind()* function:
```{r cars}
smartphone_features<-rbind(new_X_train,new_X_test)
```

combine by row *y-train* and *y_test* using *rbind()* function:
```{r cars}
smartphone_label<-rbind(y_train,y_test)
```

Since our label must be descriptive, replace (1,2,3,4,5,6) with descriptive words (Walking,Walking_upstairs,Walking_Downstairs,Sitting,Standing,Laying) in the label.

```{r cars}
descriptive_smartphone_label<-rep(0,length(smartphone_label))
descriptive_smartphone_label[smartphone_label==1]<-"WALKING"
descriptive_smartphone_label[smartphone_label==2]<-"WALKING_UPSTAIRS"
descriptive_smartphone_label[smartphone_label==3]<-"WALKING_DOWNSTAIRS"
descriptive_smartphone_label[smartphone_label==4]<-"SITTING"
descriptive_smartphone_label[smartphone_label==5]<-"STANDING"
descriptive_smartphone_label[smartphone_label==6]<-"LAYING"

descriptive_smartphone_label<-as.factor(descriptive_s martphone_label)
descriptive_smartphone_label<-data.frame(descriptive_smartphone_label)
colnames(descriptive_smartphone_label)<-"Activity"

```

**Here is our tidy dataset**
```{r cars}
smartphone_dataset<- cbind(smartphone_features,descriptive_smartphone_label)

```

##-------------------------------------####-------------------------------------#####---------------------
##-------------------------------------####-------------------------------------#####---------------------

In the second phase of this work, we want to create a new dataset from the tidy smartphone_dataset we created previously, which contains the mean values of all the variables for each subject and for each activity.

Import the subject training set and subject test set from the subject_train.txt and the subject_test.txt files, row bind *subject_train* and *subject_test* into the *subject* data frame, and merge with the smartphone_dataset.
We cal this new dataset *new_smartphone_dataset*
```{r cars}
subject_train<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", 
                                     sep ="", header = FALSE, dec =".")
                                     sep ="", header = FALSE, dec =".")
subject_test<-read.table("C:/Users/raoul/OneDrive/Documents/DataScience-Coursera/week1-clenning-data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", 
                          sep ="", header = FALSE, dec =".")
subject<-rbind(subject_train,subject_test)
colnames(subject)<-"subject"
new_smartphone_dataset<- cbind(subject_train,new_X_train,Activity)
```

Finally, the aggregate function allows us to find the *mean* of all the  variables for each subject and for each activity.
Use the *aggregate()* function in R to accomplish this:
```{r cars}
by_subject_by_label<-aggregate(new_smartphone_dataset[, 2:67], list(new_smartphone_dataset$subject,new_smartphone_dataset$Activity), mean)
