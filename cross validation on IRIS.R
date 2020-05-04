
# Cross Validation on IRIS dataset

set.seed(123)

library(MASS)
library(caret)

data(iris)
DataFrame <- iris
View(DataFrame)

head(DataFrame)

str(DataFrame)

summary(DataFrame)





library(caTools)

ind <- createDataPartition(DataFrame$Species,p=2/3, list = FALSE)
ind

trainDF <- DataFrame[ind,]
testDF <- DataFrame[-ind,]


ControlParameters <- trainControl(method ="cv",
                                  number = 5
                                  )                                  )

ControlParameters

parameterGrid <- expand.grid(mtry = c(2,3,4))
parameterGrid



modelRandom <- train(Species~., 
                     data = trainDF,
                     method ="rf",
                     trControl = ControlParameters,
                     tuneGrid = parameterGrid
                     
                     )



modelRandom 


pred <- predict(modelRandom,testDF)
pred


table(testDF$Species,pred)



