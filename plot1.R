## read the dat from the given CSV file.
epcData <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## extract the data of 1/2/2007-2/2/2007 from the table
subData <- epcData[epcData$Date %in% c("1/2/2007","2/2/2007") ,]

## construct the histogram of the extracted data
hist(as.numeric(subData$Global_active_power), 
		col="red", 
		main="Global Active Power", 
		xlab="Global Active Power (kilowatts)")

## write the histogram to plot1.png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()
