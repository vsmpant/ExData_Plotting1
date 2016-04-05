## Requires "household_power_consumption.txt" files at root of the working directory

## read the dat from the given CSV file.
epcData <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## extract the data of 1/2/2007-2/2/2007 from the table
subData <- epcData[epcData$Date %in% c("1/2/2007","2/2/2007") ,]
