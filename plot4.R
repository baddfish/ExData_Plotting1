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

#str(subSetData)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Voltage <- as.numeric(subSetData$Voltage)
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))


# upper left plot
plot(dateTime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)")


# upper right plot
plot(dateTime, Voltage, type = "l", xlab="", ylab="Voltage")


# bottom left plot
plot(dateTime, subMeter1, type = "l", ylab = "Energy sub metering", xlab="")
lines(dateTime, subMeter2, type = "l", col = "red") 
lines(dateTime, subMeter3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = 1)


# bottom right plot
plot(dateTime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()



