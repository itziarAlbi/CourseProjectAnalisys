##################################################################################
#This function checks whether root directory exists and their subdirectories "test" and "train" too
#If don't exist, it throws an error with information message and script stops
checkDirectories<-function(rootDirectoryName){	
	if (!file.exists(rootDirectoryName)){
		stop("Directory UCI HAR Dataset doesn't exist");		
	}else{
		testDirectory<-paste0(rootDirectoryName,"/test");
		trainDirectory<-paste0(rootDirectoryName,"/train");
		
		if (  !file.exists(testDirectory) 
			| !file.exists(trainDirectory)	 ){
			stop("Directory test or train don't exist");		
		}
	}
}
##################################################################################
#Renames default columns (V1, V2 ... etc.) as features.txt, except for "Subjects", "Types" and "Activities" columns.
labelFeatures<-function(rootDirectoryName, mergeData){
		featuresFile<-paste0(rootDirectoryName, "/features.txt");
		featuresData<-read.table(featuresFile);
		numberCols<-ncol(mergeData);
		for (i in 4:numberCols){
			#Second column has names, it starts renaming at fourth column
			colnames(mergeData)[i] <-as.character(featuresData[i-3,2]);
		}		
		mergeData;
}
##################################################################################

#Merges training and testing sets to create one big data set that includes testing rows and training rows.
merges<-function(rootDirectoryName){
	#1-Reads test files	
		#Read X-test in a table
		fileXTest <- paste0(rootDirectoryName, "/test/X_test.txt");
		xTest <- read.table(fileXTest);
		#Read Y-test in a table
		fileYTest <- paste0(rootDirectoryName, "/test/Y_test.txt");
		yTest<-read.table(fileYTest);
		#Read Subject-test in a table
		fileSubjectTest<-paste0(rootDirectoryName, "/test/subject_test.txt");
		subjectTest<-read.table(fileSubjectTest);

	#2-Concatenates subject, type (testing), activity and measurements
		testing<-subjectTest;
		colnames(testing)[1] <- "Subjects";		
		testing<-cbind(testing, "Testing");
		colnames(testing)[2] <- "Types";
		testing<-cbind(testing, yTest);
		colnames(testing)[3] <- "Activities";		
		testing<-cbind(testing, xTest);			
											
	#3-Reads train files
		#Read X-train in a table
		fileXTrain <- paste0(rootDirectoryName, "/train/X_train.txt");
		xTrain <- read.table(fileXTrain);
		#Read Y-train in a table
		fileYTrain <- paste0(rootDirectoryName, "/train/Y_train.txt");
		yTrain<-read.table(fileYTrain);
		#Read Subject-train in a table
		fileSubjectTrain<-paste0(rootDirectoryName, "/train/subject_train.txt");
		subjectTrain<-read.table(fileSubjectTrain);
		
	#4-Concatenate subject, type (training) activities, and measurements
		training<-subjectTrain;
		colnames(training)[1] <- "Subjects";		
		training<-cbind(training, "Training");
		colnames(training)[2] <- "Types";
		training<-cbind(training, yTrain);
		colnames(training)[3] <- "Activities";		
		training<-cbind(training, xTrain);		
				
	#5-Merges testing data frame with training data frame. Both data frames must have same column names.
		mergeData<-rbind(testing, training[1:nrow(training),]);
		
	#6- Labels features
		mergeDataLabeled<-labelFeatures(rootDirectoryName, mergeData);
		mergeDataLabeled;
}
#################################################################################
#Extracts only the measurements on the mean and standard deviation for each measurement.
#This funcions runs column names, and if the column name has the pattern "mean()" or "std()", it retrieves the index. 
#With all indexes it makes a new dataset.

getMeanAndDeviationColumns<-function(mergeData){
	columnNamesMerge<-names(mergeData);
	#Initialize a vector
	selectedColumn<-c();
	for (i in 1:length(columnNamesMerge)){
		#if the column name has the pattern "mean()" or "std()" or "activities" or "types" or "subjects" column, it adds the index in selectedColumn vector, otherwise the index is a 0.
		if (grepl(".*mean\\(\\).*", columnNamesMerge[i]) 
			| grepl(".*std\\(\\).*", columnNamesMerge[i])
			| grepl("Subjects", columnNamesMerge[i])
			| grepl("Activities", columnNamesMerge[i])
			| grepl("Types", columnNamesMerge[i])){
			selectedColumn[i] <-i;				
		}else{
			selectedColumn[i] = 0;
		}
	}
	
	#It selects columns basing on the previous vector
	meanDeviationData<-mergeData[,(selectedColumn[selectedColumn>0])];
	meanDeviationData;
}
##################################################################################
#Uses activity names described in activity_label.txt file to name the activities in the data set.
labelActivities<-function (rootDirectoryName, mergeData){

		activityFile<-paste0(rootDirectoryName, "/activity_labels.txt");
		activityData<-read.table(activityFile);
		for (i in 1:nrow(mergeData)){
			txt <- activityData[mergeData$Activities[i], 2];
			txt<-gsub("_", " ", as.character(txt));
			#First letter is a capital letter
			mergeData$Activities[i] <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", txt, perl=TRUE);		
		}
		mergeData;
}

##################################################################################
#Function that sets appropriately labels to the data set with descriptive variable names.
setVariableNames<-function(dataFrame){

	columnNames<-names(dataFrame);
	for (i in 4:length(columnNames)){
		#These following lines replaces _X, _Y or _Z by .X, .Y and .Z
		if (grepl(".*-X.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("-X", ".X", columnNames[i]);			
		}
		if (grepl(".*-Y.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("-Y", ".Y", columnNames[i]);
		}		
		if (grepl(".*-Z.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("-Z", ".Z", columnNames[i]);
		}
		columnNames[i]<-colnames(dataFrame)[i];
		#These following lines replaces tBody by Time.Body and tGravity by Time.Gravity
		if (grepl(".*tBody.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("tBody", "Time.Body", columnNames[i]);			
		}		
		if (grepl(".*tGravity.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("tGravity", "Time.Gravity", columnNames[i]);			
		}	
		#These following lines replaces fBody by Frequency.Body and fGravity by Frequency.Gravity		
		if (grepl(".*fBody.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("fBody", "Frequency.Body", columnNames[i]);			
		}		
		if (grepl(".*fGravity.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("tGravity", "Frequency.Gravity", columnNames[i]);			
		}		
		columnNames[i]<-colnames(dataFrame)[i];
		#These following lines replaces -mean by .Mean and -std by .StdDvt
		if (grepl(".*mean.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("-mean", ".Mean", columnNames[i]);			
		}
		if (grepl(".*std.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("-std", ".StdDvt", columnNames[i]);	
		}	
		columnNames[i]<-colnames(dataFrame)[i];
		#These following lines replaces BodyBody by Body
		if (grepl(".*BodyBody.*", columnNames[i])){
			colnames(dataFrame)[i] <-gsub("BodyBody", "Body", columnNames[i]);			
		}	
		columnNames[i]<-colnames(dataFrame)[i];
		#These following lines replaces "()" by a blank
		colnames(dataFrame)[i]<- gsub("\\(\\)", "", colnames(dataFrame)[i]);		
	}	
	dataFrame;
}


##################################################################################
#Function that calculates the average of each variable for each activity and each subject
calculateAverage<-function(dataFrame){
	
	#Splits the data into subsets, computes mean for each, and returns the result in a convenient form
    average <-aggregate(dataFrame, by=list(Subject=dataFrame$Subjects, Activity=dataFrame$Activities),FUN=mean, na.action = na.omit);
	#Drops old columns
	average$Subjects<-NULL; average$Types<-NULL; average$Activities<-NULL;
	#Sorts data frame by Subject, and finally by Activity
	average<-average[order(average$Subject, average$Activity),];
	average;
}
##################################################################################
#Function that writes a dataFrame in a text file, removing quotes for colNames and values, and not writing row names
writeFile<-function(dataFrame, fileName){
	write.table(dataFrame, fileName, quote = FALSE, row.names=FALSE);
}
##################################################################################

run<-function(){

	#All files must be included in root directory
	rootDirectoryName<-"./UCI HAR Dataset";
	#0-Checks if directories exist
	checkDirectories(rootDirectoryName);
	#1-Merges training and testing information
	mergeData<-merges(rootDirectoryName);
	#2-Gets mean and standard deviation columns
	mergeMeanStdData<-getMeanAndDeviationColumns(mergeData);
	#3-Labels column activity 
	mergeLabelColumnActivity<-labelActivities(rootDirectoryName, mergeMeanStdData);
	#4-Set descriptive variable names
	mergeLabeled<-setVariableNames(mergeLabelColumnActivity);
	#5-Calculates the average of each variable for each activity and each subject
	average<-calculateAverage(mergeLabeled);
	#6-Writes output in a text file
	writeFile(average, "result.txt");
	
}
