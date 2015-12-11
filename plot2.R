

library(sqldf)
tbl <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
closeAllConnections()

tbl$date_time <- strptime(paste(tbl$Date, tbl$Time),format ="%d/%m/%Y%H:%M:%S")
plot(tbl$date_time,tbl$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()