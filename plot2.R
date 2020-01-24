# Exploratory Data Anaylsis
# Course Project 1


# Reading, cleaning, and subsetting the data

data <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?")
date <- as.Date(data$Date, format = "%d/%m/%Y")
data_transf <- cbind(date,data[-1])

mydata <- subset(data_transf, date >= "2007-02-01" & date <= "2007-02-02")
data_time <- strptime(paste(mydata$date, mydata$Time), format = "%Y-%m-%d %H:%M:%S")
mydata <- cbind(data_time, mydata[,3:9])
```



# Plot 2

with(mydata, plot(Global_active_power ~ data_time, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))


dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
