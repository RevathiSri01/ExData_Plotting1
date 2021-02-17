# Load the data
data <- read.delim("household_power_consumption.txt",sep = ";")

# Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Remove incomplete observation
data <- data[complete.cases(data),]

# Change character type to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot
png("plot1.png",height = 480, width = 480)
hist(data$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
