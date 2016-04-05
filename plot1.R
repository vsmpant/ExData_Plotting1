## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

## construct the histogram of the extracted data
hist(as.numeric(subData$Global_active_power), 
		col="red", 
		main="Global Active Power", 
		xlab="Global Active Power (kilowatts)")

## write the histogram to plot1.png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()
