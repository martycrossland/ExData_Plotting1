# Create plot1 histogram, save to PNG file
#
# Read data file (data file has been subsetted to just the dates 2007-02-01 and 2007-02-02)
power <- read.csv("household_power_consumption_sub.txt", sep=";")

# Set PNG as the display device
png("plot1.png")
 # Create a histogram for Plot 1
 hist(power$Global_active_power, col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()  # Turn off PNG display device