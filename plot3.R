## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

## read the dat from the given CSV file.
epcData <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## extract the data of 1/2/2007-2/2/2007 from the table
subData <- epcData[epcData$Date %in% c("1/2/2007","2/2/2007") ,]

subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

## plot the data
plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## write the plot to plot3.png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
