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
png('plot2.png', width = 480, height = 480)
plot(weekDay, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
