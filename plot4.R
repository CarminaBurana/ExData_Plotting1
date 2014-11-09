# Read the Electric Power Consumption data
# previously downloaded from UC Irvine Machine Learning Laboratory.
data <- read.csv("data/household_power_consumption.txt", 
                 sep = ";", 
                 na.strings = "?", 
                 colClasses = c("character", 
                                "character", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric"))

# Subset the data for 2007-02-01 and 2007-02-02 dates only.
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Add a new DateTime column built out of the the existing Date and Time character columns.
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open the plot device (PNG file).
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

# Set the (2-by-2) layout of subsequently drawn figures and margins.
par (mfrow = c(2, 2))

# Plot left-top graph.
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
# Plot right-top graph.
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Plot left-bottom graph.
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       lty = 1, lwd = 1, 
       col = c("black","blue","red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
# Plot right-bottom graph.
plot(data$DateTime, data$Global_reactive_power, 
     xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")         

# Shut down graphic device.
dev.off()
