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

## Generating Plot 3##
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_2, col=columnlines[2])
lines(shxu_finalData$shxu_SetTime, shxu_finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

## Save as png ##
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
