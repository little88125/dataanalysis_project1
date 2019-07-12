shxu_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
shxu_householdFile <- "./household_power_consumption.txt"
shxu_downloadFile <- "./household_power_consumption.zip"

##Download file##
if (!file.exists(shxu_householdFile)){
    download.file(shxu_downloadURL,shxu_downloadFile)
    unzip(shxu_downloadFile,overwrite = T, exdir = ".")
}

shxu_plotData <- read.table(shxu_householdFile, header = T, sep = ";", na.string="?")

##Set up time variable##
shxu_finalData <- shxu_plotData[shxu_plotData$Date %in% c("1/2/2007","2/2/2007"),]
shxu_SetTime <-strptime(paste(shxu_finalData$Date, shxu_finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
shxu_finalData <- cbind(shxu_SetTime, shxu_finalData)

## Generating Plot 1##
hist(shxu_finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Generate a new graph window##
dev.new()

## Generating Plot 2##
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

## Generating Plot 3##
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_2, col=columnlines[2])
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

## Generating Plot 4##
shxu_labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
shxu_columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_2, type="l", col="red")
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

