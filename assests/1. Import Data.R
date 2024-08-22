# 1. IMPORT DATA ----------------------------------------------------------

# Option 1 : From a csv-file

############################# 1. Set Files ################################
setwd("//finl404arch//minnwsrv001//Underwriting & Pricing//data//shared//Pricing & Planning//Motor//Jim//Apprenticeship//Assessments//T3 Professional Portfolio//Impact Evaluation")
datafile <- "//finl404arch//minnwsrv001//Underwriting & Pricing//data//shared//Pricing & Planning//Motor//Jim//Apprenticeship//Assessments//T3 Professional Portfolio//Impact Evaluation//DIRECT_CV_DATA.csv"
###########################################################################

data <- read.csv(datafile, header=TRUE, na.strings=c("", " ", "NA"))  # All empty cells are also read as NA

# Save as data frame
data = data.frame(data)

# Save the original data - this saves time redoing the import.
data_orig <- data
data_1 <- data_orig


datastr <- data.frame(variable = names(data_1),
                      classe = sapply(data_1, class))

#write.csv(datastr, "//finl404arch//minnwsrv001//Underwriting & Pricing//data//shared//Pricing & Planning//Motor//Jim//Apprenticeship//Assessments//T3 Professional Portfolio//Impact Evaluation//1b Result.csv")
