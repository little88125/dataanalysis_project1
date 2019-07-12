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

## Save as png ##
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
