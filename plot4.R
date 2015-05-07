
### plot4.R
# (1) Read in full data [My computer has sufficient memory to do so.]
datafull <- read.table("household_power_consumption.txt",header=TRUE, sep=";",
#                        na.strings = "?")
# (2) Subset the data with the desired dates
data <- datafull[datafull$Date == "1/2/2007" | datafull$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# (3) Multiple Base plots and save as PNG format
png(file = "plot4.png")
par(mfcol = c(2, 2))
with(data, {
        # Subplot 1
        plot(Datetime,Global_active_power,type = "l",xlab="",
             ylab = "Global Active Power")
        # Subplot 2
        plot(Datetime,Sub_metering_1,type = "l",xlab="",
             ylab = "Energy sub metering")
        points(Datetime,Sub_metering_2,type = "l", col = 'red',
               xlab="",ylab = "Energy sub metering")
        points(Datetime,Sub_metering_3,type = "l", col = 'blue',
               xlab="",ylab = "Energy sub metering")
        legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
               legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        # Subplot 3
        plot(Datetime,Voltage,type = "l",xlab="datetime",
             ylab = "Voltage")        
        # Subplot 4
        plot(Datetime,Global_reactive_power,type = "l",xlab="datetime",
             ylab = "Global_reactive_power")})
dev.off()