## Same plot1-4.R ------------------
## https://groups.google.com/forum/#!topic/sqldf/1VWgp9WJLr4
library(sqldf)
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")

f <- file("household_power_consumption.txt")
data <- sqldf("select * from f where Date=='1/2/2007' or Date=='2/2/2007' ",
              file.format = list(header = TRUE, sep = ";"))
close(f)

## https://github.com/rdpeng/ExData_Plotting1
## Same plot1-4.R ------------------

DateTime <- paste(data$Date, data$Time)
weekDay <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
png('plot4.png', width = 480, height = 480)
par(mfcol = c(2, 2))
plot(weekDay, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")

plot(weekDay, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "")
par(new=T)
plot(weekDay, data$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "",
     ylim=c(0,max(data$Sub_metering_1)))
par(new=T)
plot(weekDay, data$Sub_metering_3, type = "l", col = "blue",
     xlab = "", ylab = "Energy sub metering", ylim=c(0,max(data$Sub_metering_1)))
legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), bty="n", cex=0.9,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(weekDay, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

plot(weekDay, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()
