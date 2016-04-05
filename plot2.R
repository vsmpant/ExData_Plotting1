## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

## plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## write the plot to plot2.png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
