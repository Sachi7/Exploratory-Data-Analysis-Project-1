
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
