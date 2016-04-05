## Load data from file if not available
if(!exists("subData"))
{
    source("read_data.R")
}

complete_date <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# Global active power
plot(complete_date, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot Voltage
plot(complete_date, subData$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Energy Submetering
plot(complete_date, subData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="", col="black")
lines(complete_date, subData$Sub_metering_2, type="l", col="red")
lines(complete_date, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Global reactive power
plot(complete_date, subData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
