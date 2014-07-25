PROJECT - POINT 5- VARIABLES IN TIDY DATA SET

Subject						:Identifies person who performed the activity. Its range is from 1 to 30. 
Activity					:Activity names. It takes one of these following values: Standing, Sitting, Laying, Walking, Walking Upstairs, Walking Downstairs.
-------------------------------------------------------------------------------------------------------------------------

Following lines calculate the mean of each variable according to Subject, Type and Activity. 
For instance, first record of output text file is 
1 Training Laying 0.22159824394 -0.0405139534294 ... 
that means for subject identified by "1", in training data set and for laying activity, the mean of Time.BodyAcc.Mean.X has value 0.22159824394, the mean of Time.BodyAcc.Mean.Y has value -0.0405139534294 and so on for each colum.

Time.BodyAcc.Mean.X         :Mean of time body linear acceleration in X direction
Time.BodyAcc.Mean.Y         :Mean of time body linear acceleration in Y direction
Time.BodyAcc.Mean.Z         :Mean of time body linear acceleration in Z direction
Time.BodyAcc.StdDvt.X       :Standard deviation of time body linear acceleration in X direction   
Time.BodyAcc.StdDvt.Y       :Standard deviation of time body linear acceleration in Y direction     
Time.BodyAcc.StdDvt.Z       :Standard deviation of time body linear acceleration in Z direction    
Time.GravityAcc.Mean.X      :Mean of time gravity acceleration in X direction  
Time.GravityAcc.Mean.Y      :Mean of time gravity acceleration in Y direction    
Time.GravityAcc.Mean.Z      :Mean of time gravity acceleration in Z direction   
Time.GravityAcc.StdDvt.X    :Standard deviation of gravity acceleration in X direction
Time.GravityAcc.StdDvt.Y    :Standard deviation of gravity acceleration in Y direction
Time.GravityAcc.StdDvt.Z    :Standard deviation of gravity acceleration in Z direction  
Time.BodyAccJerk.Mean.X     :Mean of time body acceleration to obtain Jerk signals in X direction
Time.BodyAccJerk.Mean.Y     :Mean of time body acceleration to obtain Jerk signals in Y direction  
Time.BodyAccJerk.Mean.Z     :Mean of time body acceleration to obtain Jerk signals in Z direction  
Time.BodyAccJerk.StdDvt.X   :Standard deviation of time body acceleration to obtain Jerk signals in X direction 
Time.BodyAccJerk.StdDvt.Y   :Standard deviation of time body acceleration to obtain Jerk signals in Y direction  
Time.BodyAccJerk.StdDvt.Z   :Standard deviation of time body acceleration to obtain Jerk signals in Z direction  
Time.BodyGyro.Mean.X        :Mean of time body gyroscope in X direction
Time.BodyGyro.Mean.Y        :Mean of time body gyroscope in Y direction  
Time.BodyGyro.Mean.Z        :Mean of time body gyroscope in Z direction   
Time.BodyGyro.StdDvt.X      :Standard deviation of time body gyroscope in X direction
Time.BodyGyro.StdDvt.Y      :Standard deviation of time body gyroscope in Y direction   
Time.BodyGyro.StdDvt.Z      :Standard deviation of time body gyroscope in Z direction    
Time.BodyGyroJerk.Mean.X    :Mean of time body gyroscope to obtain Jerk signals in X direction   
Time.BodyGyroJerk.Mean.Y    :Mean of time body gyroscope to obtain Jerk signals in Y direction    
Time.BodyGyroJerk.Mean.Z    :Mean of time body gyroscope to obtain Jerk signals in Z direction    
Time.BodyGyroJerk.StdDvt.X  :Standard deviation of time body gyroscope to obtain Jerk signals in X direction 
Time.BodyGyroJerk.StdDvt.Y  :Standard deviation of time body gyroscope to obtain Jerk signals in Y direction   
Time.BodyGyroJerk.StdDvt.Z  :Standard deviation of time body gyroscope to obtain Jerk signals in Z direction     
Time.BodyAccMag.Mean        :Mean of time body acceleration using the Euclidean norm
Time.BodyAccMag.StdDvt      :Standard deviation of time body acceleration using the Euclidean norm    
Time.GravityAccMag.Mean     :Mean of time gravity acceleration using the Euclidean norm  
Time.GravityAccMag.StdDvt   :Standard deviation of time gravity acceleration using the Euclidean norm 
Time.BodyAccJerkMag.Mean    :Mean of time body acceleration to obtain Jerk signals using the Euclidean norm
Time.BodyAccJerkMag.StdDvt  :Standard of time body acceleration to obtain Jerk signals using the Euclidean norm    
Time.BodyGyroMag.Mean       :Mean of time body gyroscope using the Euclidean norm
Time.BodyGyroMag.StdDvt     :Standard deviation of time body gyroscope using the Euclidean norm  
Time.BodyGyroJerkMag.Mean   :Mean of time body gyroscope to obtain Jerk signals using the Euclidean norm    
Time.BodyGyroJerkMag.StdDvt :Standard deviation of time body gyroscope to obtain Jerk signals using the Euclidean norm 
--------------------------------------------------------------------------------------------  
Frequency.BodyAcc.Mean.X    :Mean of frequency body linear acceleration in X direction   
Frequency.BodyAcc.Mean.Y    :Mean of frequency body linear acceleration in Y direction   
Frequency.BodyAcc.Mean.Z    :Mean of frequency body linear acceleration in Z direction    
Frequency.BodyAcc.StdDvt.X  :Standard deviation of frequency body linear acceleration in X direction   
Frequency.BodyAcc.StdDvt.Y  :Standard deviation of frequency body linear acceleration in Y direction       
Frequency.BodyAcc.StdDvt.Z  :Standard deviation of frequency body linear acceleration in Z direction       
Frequency.BodyAccJerk.Mean.X:Mean of frequency body acceleration to obtain Jerk signals in X direction
Frequency.BodyAccJerk.Mean.Y:Mean of frequency body acceleration to obtain Jerk signals in Y direction    
Frequency.BodyAccJerk.Mean.Z:Mean of frequency body acceleration to obtain Jerk signals in Z direction    
Frequency.BodyAccJerk.StdDvt.X:Standard deviation of frequency body acceleration to obtain Jerk signals in X direction
Frequency.BodyAccJerk.StdDvt.Y:Standard deviation of frequency body acceleration to obtain Jerk signals in Y direction  
Frequency.BodyAccJerk.StdDvt.Z:Standard deviation of frequency body acceleration to obtain Jerk signals in Z direction  
Frequency.BodyGyro.Mean.X:	:Mean of frequency body gyroscope in X direction        
Frequency.BodyGyro.Mean.Y   :Mean of frequency body gyroscope in Y direction     
Frequency.BodyGyro.Mean.Z   :Mean of frequency body gyroscope in Z direction     
Frequency.BodyGyro.StdDvt.X :Standard deviation of frequency body gyroscope in X direction 
Frequency.BodyGyro.StdDvt.Y :Standard deviation of frequency body gyroscope in Y direction     
Frequency.BodyGyro.StdDvt.Z :Standard deviation of frequency body gyroscope in Z direction     
Frequency.BodyAccMag.Mean   :Mean of frequency acceleration using the Euclidean norm  
Frequency.BodyAccMag.StdDvt :Standard deviation of frequency body acceleration using the Euclidean norm  
Frequency.BodyAccJerkMag.Mean : Mean of frequency body acceleration to obtain Jerk signals using the Euclidean norm 
Frequency.BodyAccJerkMag.StdDvt: Standard of frequency body acceleration to obtain Jerk signals using the Euclidean norm    
Frequency.BodyGyroMag.Mean  :Mean of frequency body gyroscope using the Euclidean norm 
Frequency.BodyGyroMag.StdDvt:  Standard deviation of frequency body gyroscope using the Euclidean norm    
Frequency.BodyGyroJerkMag.Mean: Mean of frequency body gyroscope to obtain Jerk signals using the Euclidean norm     
Frequency.BodyGyroJerkMag.StdDvt:Standard deviation of frequency body gyroscope to obtain Jerk signals using the Euclidean norm 
