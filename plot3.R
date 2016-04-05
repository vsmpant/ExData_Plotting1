## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

complete_date <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## plot the data
plot(complete_date, subData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(complete_date, subData$Sub_metering_2, type="l", col="red")
lines(complete_date, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## write the plot to plot3.png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
