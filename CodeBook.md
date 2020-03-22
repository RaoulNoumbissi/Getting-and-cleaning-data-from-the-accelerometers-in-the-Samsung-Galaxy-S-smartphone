---
title: "CodeBook"
Author: "Raoul Noumbissi"
Date:   "3/22/2020"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
The first step in cleanning our dataset is to import the text  file containing or describing  all the features in the dataset. There are a total of 561 features in the text file, but we only need those features that represent either the *mean* or *standard deviation*.

```
features 
```

To isolate the necessary features, which we save in a variable called *used_features*, we use the *grep()* function below. 
```
used_features
```
The data set in this study will contain 66 features that each describe *mean* or *std* values.

Now that the features have been determined, we import  text files *X_train.txt*, *y_train.txt*, *X_test.txt*, *y_test.txt* using function *read.tabe()*

The training set:
```
X_train
y_train
```

The test set:
```
X_test
y_test

```


We only require the used features in our training and test set:
```
new_X_train
new_X_test

```

Now, we need to create the desired dataframe, with 66 features and the label, for a total of 67 columns and 10299 rows.To accomplish this, 

combine by row *X_train* and *X_test* using *rbind()* function:
```
smartphone_features
```

combine by row *y-train* and *y_test* using *rbind()* function:
```
smartphone_label
```

Since our label must be descriptive, replace (1,2,3,4,5,6) with descriptive words (Walking,Walking_upstairs,Walking_Downstairs,Sitting,Standing,Laying) in the label.

```
descriptive_smartphone_label
```

Here is our tidy dataset
```
smartphone_dataset
```

##-------------------------------------####-------------------------------------#####---------------------
##-------------------------------------####-------------------------------------#####---------------------

In the second phase of this work, we want to create a new dataset from the tidy smartphone_dataset we created previously, which contains the mean values of all the variables for each subject and for each activity.

Import the subject training set and subject test set from the subject_train.txt and the subject_test.txt files, row bind *subject_train* and *subject_test* into the *subject* data frame, and merge with the smartphone_dataset.
We cal this new dataset *new_smartphone_dataset*
```
subject_train
subject_test
subject
new_smartphone_dataset
```

Finally, the aggregate function allows us to find the *mean* of all the  variables for each subject and for each activity.
Use the *aggregate()* function in R to accomplish this:
```
by_subject_by_label
```


Here is a summary of the relevant files, variables and functions for this work:

**Files**

            
*X_tain.txt*:         Contains the training set               

*y_train.txt*:         Contains the training label                  

*subject_train.txt*:   Contains the subject train set      

*subject_train.txt*:   Contains the subject test set

*X_test.txt*:          Contains the test set

*y_test.txt*:          Contains the test label

*features.txt*:        contains all the features of the dataset

**Variables**

*features* :           a data frame that stores all 561 features, 2 columns, 561 rows

*used_features*:    a character vector that stores 66 features which represent either mean or std

*X_train*:             a data frame variable that stores the training set, 561 columns, 7352 rows 

*y_train*:             a data frame variable that stores the training label, 1 column, 7352 rows 

*subject_train*:       a data frame variable that stores the subject train set, 1 column, 7352 rows with 
                      integer values 1-30  
*subject_test*:        a data frame variable that stores the subject test set, 1 column, 2947 rows with 
                      integer values 1-30 
*subject*:             a data frame variable that stores the entire subject dataset, 1 column, 10299 rows

*X_test*:              a data frame variable that stores the test set, 561 columns, 2947 rows           

*y_test*:              a data frame variable that stores the test label, 1 columns, 2947 rows

*new_X_train*:         a data frame variable that stores the training set with the extracted features, 66 
                      columns, 7352 rows 

*new_X_test*:          a data frame variable that stores the est set with the extracted features, 66 
                      columns, 2947 rows
*smarphone_features*:  a data frame variable that is a combination by row of *new_X_train* and  
                       *new_X_test*

*smarphone_label*:     a data frame variable that is a combination by row of *y_train* and *y_test*.
                      the variable stores the activity of each subject with codes 1 through 6.

*descriptive_smartphone_label*: a data frame variable stores the activity of each subject with the 
                               descriptions: "Walking","Walking_upstairs" ,"Walking_Downstairs", 
                               "Sitting", "Standing,Laying".

*smartphone_dataset*:  The tidy dataset for this work. Obtained through the combination by column of 
                      *smarphone_features* and *descriptive_smartphone_label*.

*Activity*            A factor vector that stores the activity of the users from row 1 through 7352 of 
                      the *smartphone_dataset*

*new_smartphone_dataset*: A data frame that combines the subject_train, the training set and the Activity, 
                         68 columns, 7352 rows.

*by_Subject_by_Activity*:    A data frame that contains the mean of all the variables in the 
                         *new_smartphone_dataset* for each subject and  each activity.                     

**Functions**

*read.table()*:           Reads the data in the diffent text files and output a data frame

*grep()*:                 select variables with specific characters. "mean()" and "std()" in this case.      
*colnames()*:             Assign a name to a column of a dataframe.

*rep()*:                  Repeat a value x amount of time and output a vector.

*as.factor()*:            Transforms to a *factor* class

*data.frame()*:           Transform to *data.frame()* class

*rbind()*:                Binds data frames by row

*cbind()*:                Binds data frames by column

*aggregate()*:            Applies a function to several columns of a *group_by data frame*         

Note: You can find the dataset for the project here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip