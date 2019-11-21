#Upload data
data1<-read.csv("C:/Users/Emma/Desktop/cars.csv")


####Information of data set####
attributes(data1)
#Summarization of data set
summary(data1)

#Change type of data
data1$name.of.car<-as.factordata(data1$name.of.car)

#Change name of column
names(data1)<-c("Name","Speed","Distance")

#Summary - no NA:s
summary(data1)

#Dubblecheck NA:s - there is none
is.na(data1)

#Train and test data
set.seed(123)
trainSize<-round(nrow(data1)*0.7)
testSize<-nrow(data1)-trainSize
training_indices<-sample(seq_len(nrow(data1)),size =trainSize)
trainSet<-data1[training_indices,]
testSet<-data1[-training_indices,]

#Create model (Linear regression) 
Carsmodel<-lm(Distance~ Speed, trainSet)
summary(Carsmodel)

#Predictions
PredictionsName <- predict(Carsmodel,testSet)
PredictionsName


