library("dplyr")
setwd("~/Desktop/test/exdata_data_household_power_consumption")
power<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
power2 <- subset(power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
power3 <- power2[complete.cases(power2),]

## Combine Date and Time column
power3 <- mutate(power3,DateTime=paste(power$Date, power3$Time))
power3$DateTime <- as.POSIXct(power3$DateTime)

## Create Plot 2
plot(power3$Global_active_power~power3$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()