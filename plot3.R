
### plot3.R
# (1) Read in full data [My computer has sufficient memory to do so.]
datafull <- read.table("household_power_consumption.txt",header=TRUE, sep=";",
                       na.strings = "?")
# (2) Subset the data with the desired dates
data <- datafull[datafull$Date == "1/2/2007" | datafull$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# (3) Multiple plot and save as PNG format
png(file = "plot3.png")
plot(data$Datetime,data$Sub_metering_1,type = "l",xlab="",
     ylab = "Energy sub metering")
points(data$Datetime,data$Sub_metering_2,type = "l", col = 'red',
       xlab="",ylab = "Energy sub metering")
points(data$Datetime,data$Sub_metering_3,type = "l", col = 'blue',
       xlab="",ylab = "Energy sub metering")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()