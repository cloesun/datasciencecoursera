#load libraries 


# download files 
if(!file.exists("data")){dir.create("data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/test.zip", method ="curl")
dateDownloaded<-date()

#upzip
zipF<- "./data/test.zip"
outDir<-"./data/test/"
unzip(zipF,exdir=outDir)

#read features 
features <-read.table("./data/test/UCI HAR Dataset/features.txt", 
                                sep = "")

#read files
curdir <-c("./data/test/UCI HAR Dataset/test/",
           "./data/test/UCI HAR Dataset/train/")

data <- NULL 
cnames <- c(as.character(features$V2),  "y", "subject")
for (data_path in curdir) 
{
  tmp <- strsplit(data_path, "*//*")
  sig <- tmp[[1]][5]
  
  x<- read.delim(paste0(data_path, "X_", sig, ".txt"), sep ="") #x file name 
  y<- read.delim(paste0(data_path, "y_", sig, ".txt"), sep ="") #y file name 
  subj<- read.delim(paste0(data_path, "subject_", sig, ".txt"), sep ="") #subject id 
  
  data1<-cbind(x,y,subj)   # to bind all the columns 
  if (is.null (data))
  {
    data<-data1 
  }
  else
  {
    colnames(data1) <-cnames
    colnames(data) <- cnames
    data <-rbind(data1, data)
  }
}


#write table into file 
write.table(data, file = "./data/test/UCI HAR Dataset/fulldataset.txt", row.names = FALSE)
  








