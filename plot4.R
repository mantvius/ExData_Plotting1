# downloading and unpacking data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","consumption.zip")
unzip("consumption.zip")

# loading the dataset into R, reading data from just dates 2007-02-01 and 2007-02-02
library(sqldf)
tbl <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
closeAllConnections()

# converting Date and Time variables to one variable of Date/Time class
tbl$date_time <- strptime(paste(tbl$Date, tbl$Time),format ="%d/%m/%Y%H:%M:%S")

# plotting and saving to a png file
png(file = "plot4.png")

par(mfcol = c(2,2))

plot(tbl$date_time,tbl$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")

plot(tbl$date_time,tbl$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(tbl$date_time,tbl$Sub_metering_1, type = "l")
points(tbl$date_time,tbl$Sub_metering_2, type = "l", col = "red")
points(tbl$date_time,tbl$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 2, y.intersp = 0.99, cex = .7, adj = .1)

plot(tbl$date_time,tbl$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(tbl$date_time,tbl$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

