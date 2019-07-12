## Generate a new graph window##
dev.new()

## Generating Plot 2##
plot(shxu_finalData$shxu_SetTime, shxu_finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

## Save File as png ##
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
