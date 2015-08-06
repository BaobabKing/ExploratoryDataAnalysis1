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

png('plot1.png', width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
#dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()