
library(dplyr)
library(reshape2)

###read in 6 data files
#setwd("c:/devl/coursera/GACD/UCI HAR Dataset")
working.directory <- getwd()

subj.test <- read.table(file=paste0(working.directory,"/test/subject_test.txt"))
x.test <- read.table(file=paste0(working.directory,"/test/x_test.txt"))
y.test <- read.table(file=paste0(working.directory,"/test/y_test.txt"))

subj.train <- read.table(file=paste0(working.directory,"/train/subject_train.txt"))
x.train <- read.table(file=paste0(working.directory,"/train/x_train.txt"))
y.train <- read.table(file=paste0(working.directory,"/train/y_train.txt"))

###read in file with x-header info
x.head <- read.table(file=paste0(working.directory,"/features.txt"))

y.vals <- read.table(file=paste0(working.directory,"/activity_labels.txt"))

###remove ugly characters
x.head$V2 <- gsub("([\\(\\)\\,])","",x.head$V2)

###rename set with meaningful names
names(x.test) <- x.head$V2
names(x.train) <- x.head$V2

### merge data asets
subj.merge <- rbind(subj.test, subj.train)
x.merge <- rbind(x.test, x.train)
y.merge <- rbind(y.test, y.train)

# add descriptions for each activity
y.merge <- merge(y.merge, y.vals, by = 'V1', all.y = TRUE)

###rename subject/y with meaningful names
names(subj.merge) <- c('subject.id')
names(y.merge) <- c('V1','activity.id')

#reduce to useful columns
y.merge <- subset(y.merge, select=c("activity.id"))

###extract mean and sd related columns
mean.list <- grep('mean', x.head$V2, ignore.case=TRUE )
std.list <- grep('std', x.head$V2, ignore.case = TRUE)
comb.list <- c(mean.list, std.list)
mean.and.std.data <- x.merge[,c(comb.list)]

###add on subject and activity columns
tidy.set <- cbind(subj.merge, y.merge, mean.and.std.data)

melted <- melt(tidy.set, id.vars=c("subject.id", "activity.id")) 
grouped <- group_by(melted, subject.id, activity.id, variable)
xx <- summarise(grouped, mean=mean(value))
final.set <- dcast(xx, subject.id+activity.id~variable)

write.table(final.set, file = paste0(working.directory,"/UCI HAR Dataset/LCoutput.txt"), row.name=FALSE)
