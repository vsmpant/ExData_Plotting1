## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

## read the dat from the given CSV file.
epcData <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## extract the data of 1/2/2007-2/2/2007 from the table
subData <- epcData[epcData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

## plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## write the plot to plot2.png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
