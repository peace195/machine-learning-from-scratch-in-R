library(randomForest)

train <- read.csv("../train.csv")
test  <- read.csv("../test.csv")

train$label <- as.factor(train$label)
rf <- randomForest(formula = label ~ ., data = train, ntree = 20, mtry = 200, importance = TRUE)
ret <- predict(rf, test)

as.data.frame(ret) -> ret
ret$ImageId = 1:28000
colnames(ret) <- c("Label", "ImageId")
write.csv(ret, "submission.csv", row.names = FALSE)
