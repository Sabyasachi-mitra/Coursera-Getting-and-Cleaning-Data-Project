# CodeBook for the Rscript variables.

package <- "data.table" and "plyr".

trainX = for load X train dataset
trainY = Y train dataset
trainsub = train subjects dataset
testY = Y test dataset
testX = test X dataset
testsub = test subject data set
comboX = merging of both X dataset of train and test
comboY = merging of both Y dataset of train and test by rows
combosub = merging of both train and test data set of subject by rows as only one column was there
features = features dataset
mean_std = mean and standard devviation rows of features and removes of the un-necessary signs
names(comboX) = initials capitalisation
activity = activity datset
names(comboY) = comboY names changes to activity the heading
names(combosub) = column name changes to the subject
cleanData = column binding of comboX, comboY, combosub in one factor
avg_tidy_data = ddply usage for summarizing long data and valued as a mean, also data.table can be used too.

