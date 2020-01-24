# Exploratory Data Anaylsis
## Course Project 1


# Reading, cleaning, and subsetting the data

data <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?")
date <- as.Date(data$Date, format = "%d/%m/%Y")
data_transf <- cbind(date,data[-1])

mydata <- subset(data_transf, date >= "2007-02-01" & date <= "2007-02-02")
data_time <- strptime(paste(mydata$date, mydata$Time), format = "%Y-%m-%d %H:%M:%S")
mydata <- cbind(data_time, mydata[,3:9])


# Plot 4

png("plot3.png", width=480, height=480)

par(mfrow = c(2, 2))

with(mydata, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(mydata, plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(mydata, plot(date_time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(mydata, lines(date_time, Sub_metering_2, type = "l", col = "red"))
with(mydata, lines(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n")

with(mydata, plot(date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()
