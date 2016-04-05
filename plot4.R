## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

globalReactivePower <- as.numeric(subData$Global_reactive_power)
volt <- as.numeric(subData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
