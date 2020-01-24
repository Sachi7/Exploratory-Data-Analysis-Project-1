
# Exploratory Data Anaylsis
## Course Project 1: Plot 3


# Reading, cleaning, and subsetting the data

data <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?")
date <- as.Date(data$Date, format = "%d/%m/%Y")
data_transf <- cbind(date,data[-1])

mydata <- subset(data_transf, date >= "2007-02-01" & date <= "2007-02-02")
date_time <- strptime(paste(mydata$date, mydata$Time), format = "%Y-%m-%d %H:%M:%S")
mydata <- cbind(date_time, mydata[,3:9])


# Plot 3

png("plot3.png", width=480, height=480)

with(mydata, plot(date_time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(mydata, points(date_time, Sub_metering_2, type = "l", col = "red"))
with(mydata, points(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
