#Iris
install.packages("readr")
library(readr)


Iris <- read.csv("C:/Users/Emma/Desktop/iris.csv")

View(Iris)

Iris[,1] <- NULL

#Summary etc

attributes(Iris)

summary(Iris) 

str(Iris)

names(Iris)

Iris[,5] <- as.numeric(Iris[,5])
Iris$Species <- as.numeric(Iris$Species)

hist(Iris$Species)

plot(Iris$Sepal.Length)

qqnorm(Iris$Sepal.Width)
     
set.seed(123)
     
trainSize<- round(nrow(Iris) * 0.7)
     
testSize<- nrow(Iris) -trainSize
     
trainSize
     
testSize

training_indices<-sample(seq_len(nrow(Iris)),size =trainSize)
     
trainSet<- Iris[training_indices, ]
     
testSet <- Iris[-training_indices, ]
     
LinearModel<-lm(Petal.Length~ Petal.Width, trainSet)
     
summary(LinearModel)
     
PredictionsName <- predict(LinearModel,testSet)
     
PredictionsName

write.csv(PredictionsName,file="C:/Users/Emma/Desktop/Iris_predictions.csv")
