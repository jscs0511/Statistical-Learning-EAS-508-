
View(CLASSIFICATION)
library(rpart)

# regression tree model that will predict survived people.
model = rpart(Survived ~ ., data=CLASSIFICATION, method="class")

# By using model, make predicted output.
predict_one=predict(model,type="class")

# Identify the table
table(predict_one)

# Make a confusion matrix
table(predict_one, CLASSIFICATION$Survived)