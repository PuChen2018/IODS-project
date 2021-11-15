#Author: Pu Chen, 09112021, exercise code for week 2 homework
learning2014<-read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt",sep = "\t",header=TRUE)
dim(learning2014)
str(learning2014)
#'data.frame':	183 obs. of  60 variables

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
library(dplyr)
learning2014$attitude<-learning2014$Attitude/10
deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep<-rowMeans(deep_columns)
surface_columns<-select(learning2014,one_of(surface_questions))
learning2014$surf<-rowMeans(surface_columns)
strategic_columns <- select(learning2014,one_of(strategic_questions))
learning2014$stra<-rowMeans(strategic_columns)

# choose a handful of columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
lrn14<-select(learning2014,one_of(keep_columns))
colnames(lrn14)
colnames(lrn14)[2]<-"age"
colnames(lrn14)[7]<-"points"
lrn14<-filter(lrn14,points>0)
write.table(lrn14,"learning2014.txt",quote = TRUE, sep = " ",row.names = FALSE,
          col.names = T)
