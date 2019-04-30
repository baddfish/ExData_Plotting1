## png 3 
# read in data with read.table
my_data <- "household_power_consumption.txt"

# looking at the dataset
head(my_data)
new_data <- read.table(my_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(dateTime, subMeter1, type = "l", ylab = "Energy sub metering", xlab="")
lines(dateTime, subMeter2, type = "l", col = "red")
lines(dateTime, subMeter3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = 1)

dev.off()