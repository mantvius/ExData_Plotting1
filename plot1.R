library(sqldf)
tbl <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
closeAllConnections()

tbl$Date <-as.Date(tbl$Date, format ="%d/%m/%Y")
tbl$Time<-strptime(tbl$Time,format = "%H:%M:%S")
tbl$Time<-format(tbl$Time,"%H:%M:%S")

hist(tbl$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", ylab = "Frequency", main = "Global active power")
dev.copy(png, file = "plot1.png")
dev.off()
