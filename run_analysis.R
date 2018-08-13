# read the values from the two largest tables recording physical findings
dtr_X<-read.table('UCI HAR Dataset/train/X_train.txt')
dts_X<-read.table('UCI HAR Dataset/test/X_test.txt')
library(dplyr)
n = 30 # Number of subjects
# Read the ID of the subjects
dtr_s <- read.table('UCI HAR Dataset/train/subject_train.txt')
dts_s <- read.table('UCI HAR Dataset/test/subject_test.txt')

#Read the activity table
dtr_a <- read.table('UCI HAR Dataset/train/y_train.txt')
dts_a <- read.table('UCI HAR Dataset/test/y_test.txt')

# Add a recording ID field to subject table
dtr_s$RecordingID <- seq.int(nrow(dtr_s))
dts_s$RecordingID <- seq.int(nrow(dts_s))

#Change col names of subject table
colnames(dtr_s)<-c('SubjectID','RecordingID')
colnames(dts_s)<-c('SubjectID','RecordingID')

# Add a recording ID field to sctivity table
dtr_a$RecordingID <- seq.int(nrow(dtr_a))
dts_a$RecordingID <- seq.int(nrow(dts_a))

#Change col names of subject table
colnames(dtr_a)<-c('ActivityID','RecordingID')
colnames(dts_a)<-c('ActivityID','RecordingID')

#Read activity labels
al <- read.table('UCI HAR Dataset/activity_labels.txt')
colnames(al) <- c('ActivityID','Name')

#Read recording labels
rf <- read.table('UCI HAR Dataset/features.txt')
rl <- rf[,2]

# Set col names for main table
colnames(dtr_X) <- rl
colnames(dts_X) <- rl
dtr_X$RecordingID <- seq.int(nrow(dtr_X))
dts_X$RecordingID <- seq.int(nrow(dts_X))

#Prepare horizontally merged training data subject and activities
m_tr_1 <- merge(dtr_s, dtr_a)
m_ts_1 <- merge(dts_s, dts_a)

#Prepare horizontally merged train table
m_tr_2 <- merge(m_tr_1, dtr_X)
m_ts_2 <- merge(m_ts_1, dts_X)

#Merge trest and train tables horizontally
m <- rbind(m_tr_2,m_ts_2)

# Get means label indexes
means_i <- grep("*mean*",names(m))

# Get stdev label indexes
std_i <- grep("*std*", names(m))

#Print means abd stdev
#print(head(m[,means_i]))
#print(head(m[,std_i]))

x <- list() # Final table
i <- 1
for (ac in al[,1]) { # Activities
  for (s in 1:n)  { #Subjects
    #Filter merged table by activities and subject
    v1 <- filter(m,ActivityID == ac & SubjectID == s)
    #Calculate means
    cm <- colMeans(v1)
    #Exclude fir three cols Recdording ID, Activity ID and Subject ID
    cm <- cm[4:length(cm)]
    #Combine into a vector
    v2 <- c(ac,s,cm)
    #Insert vector in list
    x[[i]] <- v2
    i <- i + 1
  }
}
#Convert list to dataframe contaning averages of all fields
df <- do.call("rbind",x)
colNames(df) <- c('ActivityID','SubjectID',paste('Mean of', rl, sep=' '))
write.table(df,'tidy.txt',row.name = F)