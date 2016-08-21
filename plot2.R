# Create plot2 line plot, save to PNG file

# Load lubridate library
library(lubridate)

# Read data file (data file has been subsetted to just the dates 2007-02-01 and 2007-02-02)
power <- read.csv("household_power_consumption_sub.txt", sep=";")

# Concatenate data and time text fields, convert to Date field
power$dateTime <- strptime(paste(power$obsDate, power$obsTime, sep=" "), "%d/%m/%Y %H:%M:%S")

# Set PNG as the display device with 480x480 dimensions
png("plot2.png", width=480, height=480)
   # Create a line plot for Plot 2
   plot(power$dateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()  # Turn off PNG display device