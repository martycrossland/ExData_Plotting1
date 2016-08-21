# Create plot3 line plots for three variables, save to PNG file

# Load lubridate library
library(lubridate)

# Read data file (data file has been subsetted to just the dates 2007-02-01 and 2007-02-02)
power <- read.csv("household_power_consumption_sub.txt", sep=";")

# Concatenate data and time text fields, convert to Date field
power$dateTime <- strptime(paste(power$obsDate, power$obsTime, sep=" "), "%d/%m/%Y %H:%M:%S")

# Set PNG as the display device with 1020x760 dimensions
png("plot4.png", width=1020, height=760)
   
   # Set up two-by-two multiplot area, row-oriented
   par(mfrow=c(2,2))
   
   # Create a line plot for upper left (Plot 2)
   plot(power$dateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
   
   #Create a line plot of voltage for upper right
   plot(power$dateTime, power$Voltage, type="l")
   
   # Create three line plots for lower left (Plot 3), using Sub_metering variables
   plot(power$dateTime, power$Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
   lines(power$dateTime, power$Sub_metering_2, col = "red")
   lines(power$dateTime, power$Sub_metering_3, col = "blue")
   legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
   
   #Create a line plot of Global reactive power for lower right
   plot(power$dateTime, power$Global_reactive_power, type="l")
   
dev.off()  # Turn off PNG display device