---
date: "1/23/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Exploratory Data Anaylsis
## Course Project 1

<br>

**Reading and cleaning the data**
```{r}

data <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?")
```

```{r}
date <- as.Date(data$Date, format = "%d/%m/%Y")
data_transf <- cbind(date,data[-1])
```

```{r}
mydata <- subset(data_transf, date >= "2007-02-01" & date <= "2007-02-02")

data_time <- strptime(paste(mydata$date, mydata$Time), format = "%Y-%m-%d %H:%M:%S")

mydata <- cbind(data_time, mydata[,3:9])
```

# Plot 1: Global Active Power

```{r message=FALSE, warning=FALSE}
gap <- mydata$Global_active_power
hist(gap, freq = T, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
```

```{r eval = FALSE }
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
```
