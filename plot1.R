# Exploratory Data Anaylsis
## Course Project 1


# Reading, cleaning, and subsetting the data

data <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?")
date <- as.Date(data$Date, format = "%d/%m/%Y")
data_transf <- cbind(date,data[-1])

mydata <- subset(data_transf, date >= "2007-02-01" & date <= "2007-02-02")


# Plot 1: Global Active Power

gap <- mydata$Global_active_power
hist(gap, freq = T, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

