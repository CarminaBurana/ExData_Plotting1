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
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
# Draw the histogram 
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Shut down graphic device.
dev.off()