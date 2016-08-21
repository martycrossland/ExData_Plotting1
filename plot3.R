# Create plot3 line plots for three variables, save to PNG file

# Load lubridate library
library(lubridate)

# Read data file (data file has been subsetted to just the dates 2007-02-01 and 2007-02-02)
power <- read.csv("household_power_consumption_sub.txt", sep=";")

# Concatenate data and time text fields, convert to Date field
power$dateTime <- strptime(paste(power$obsDate, power$obsTime, sep=" "), "%d/%m/%Y %H:%M:%S")

# Set PNG as the display device with 480x480 dimensions
png("plot3.png", width=480, height=480)
   # Create three line plots for Plot 3, using Sub_metering variables
   plot(power$dateTime, power$Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
   lines(power$dateTime, power$Sub_metering_2, col = "red")
   lines(power$dateTime, power$Sub_metering_3, col = "blue")
   legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
dev.off()  # Turn off PNG display device