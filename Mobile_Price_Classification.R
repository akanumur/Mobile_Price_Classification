getwd()
setwd("C:/Users/kanum/Desktop/Akshata/mini_projects/Mobile_Price_Classification")
#Import my data
mydata <- read.table("train.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?"))
# Explore data
nrow(mydata)
#Summary of data
summary(mydata)
## Note: Since categorical variables enter into statistical models differently than continuous variables, storing data as factors insures that the modeling functions will treat such data correctly:
mydata$price_range <- as.factor(mydata$price_range)
# Install packages required for random forest:
install.packages("randomForest")
# Load packages required for random forest:
library(randomForest)

#Buliding the rf model
#Change the number of ntree and repeat thia process till we reduce OOB estimate
rf <-randomForest(price_range~., data=mydata, ntree=60, na.action=na.exclude, importance=T,
                  proximity=T) 
print(rf)
# the mininmum OOB is observed at ntree = 60

#To get optimal split of variables fix ntree=60
mtry <- tuneRF(mydata[-21], mydata$price_range, ntreeTry=60, 
               stepFactor=1.5, improve=0.01, trace=TRUE, plot=TRUE)

best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]

print(mtry)

#Buliding RF with optimal ntree and mtry
set.seed(32)
rf <-randomForest(price_range~., data=mydata, mtry=best.m, importance=TRUE, ntree=60)
print(rf)

#Variable Importance which does Gini Importance in backend
importance(rf)
varImpPlot(rf)

# Calculate predictive probabilities of training dataset.
pred1 = predict(rf,type = "prob")

#Import my test data
testdata <- read.table("test.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?"))

predicted_values = predict(rf, type = "prob", testdata) # Use the rf classifier to make the predictions

final_data <- cbind(testdata, predicted_values) # Add the predictions to test_data
