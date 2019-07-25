setwd("~/Desktop/test/exdata_data_household_power_consumption")
power<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
power2 <- subset(power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
power3 <- power2[complete.cases(power2),]


## Create Plot 1
hist(power3$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()