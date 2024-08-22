# 4. SPLITTING DATA IN TRAIN- AND TEST SET --------------------------------
#data <- data_4
data <- data_3

set.seed(16)                    # Always set the seed so you can replicate results if necessary
index <- 1:nrow(data)
testindex <- sample(index, trunc(length(index)/3))
trainset <- data[-testindex,]
testset <- data[testindex,]
