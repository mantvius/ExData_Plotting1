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
plot(tbl$date_time,tbl$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()