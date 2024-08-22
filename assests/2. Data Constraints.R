# 2. DATA EXPLORATION -----------------------------------------------------
data <- data_1
data_Rem <- data


########################### 2. Data Constraints ###########################
#data_Rem <- data_Rem[which(data_Rem$SCORE1!= -999),]
#data_Rem <- data_Rem[which(data_Rem$FORTISYEARS== 0),]
###########################################################################
### Adjust for Student (==)/Non Students (!=) ###
data <- data_Rem


# Get shape of data
print(paste0("(Nrow, Ncol) = (", nrow(data), ",", ncol(data), ")"))

# Get distribution of variables
summary <- summary(data)
print(summary)

# Check data types of all variables
str(data)      

# Check the number and percentage of NA's per column
na_count <- sapply(data, function(y) sum(length(which(is.na(y)))))
na_perc <- round(na_count/nrow(data)*100, digits=1)
na <- data.frame(na_count, na_perc)
print(na)

na_df <- cbind(Variables = rownames(na), na)

# What class are the columns.
datastr2 <- data.frame(variable = names(data),
                       classe = sapply(data, class)
)

# Combine Class with NAs
dataOut <- cbind(datastr2, na_df)
write.csv(dataOut, "2b. Dataset in R.csv")

data_2 <- data
