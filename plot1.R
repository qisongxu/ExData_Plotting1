
### plot1.R
# (1) Read in full data [My computer has sufficient memory to do so.]
datafull <- read.table("household_power_consumption.txt",header=TRUE, sep=";",
                       na.strings = "?")
# (2) Subset the data with the desired dates
data <- datafull[datafull$Date == "1/2/2007" | datafull$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# (3) Histogram plot and save as PNG format
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")
dev.off()