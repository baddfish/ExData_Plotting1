# Went to UCI repository and downloaded dataset
# https://archive.ics.uci.edu/ml/machine-learning-databases/00235/

# saved file locally
# set working directory Please note this will be unique to your computer
setwd("C:/Users/Admin/Dropbox/Data Science/R projects")

# read in data with read.table
my_data <- "household_power_consumption.txt"

# looking at the dataset
head(my_data)


new_data <- read.table(my_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007") ,]


#str(subsetdata)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


## png 2 need to have Thu, Fri, Sat on x axis
date <- as.Date(subSetData$Date)
barplot(globalActivePower, col="black", ylab="Global Active Power (kilowatts)")
