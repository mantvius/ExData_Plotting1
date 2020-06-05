# downloading and unpacking data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","consumption.zip")
unzip("consumption.zip")

# loading the dataset into R, reading data from just dates 2007-02-01 and 2007-02-02
library(sqldf)
tbl <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
closeAllConnections()

# converting Date and Time variables to Date/Time classes 
tbl$Date <-as.Date(tbl$Date, format ="%d/%m/%Y")
tbl$Time<-strptime(tbl$Time,format = "%H:%M:%S")
tbl$Time<-format(tbl$Time,"%H:%M:%S")

# plotting and saving to a png file
hist(tbl$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", ylab = "Frequency", main = "Global active power")
dev.copy(png, file = "plot1.png")
dev.off()
