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

# Combine Date and Time column
dateTime <- paste(data$Date, data$Time)

# Name the vector
dateTime <- setNames(dateTime, "DateTime")

# Remove Date and Time column
data <- data[ ,!(names(data) %in% c("Date","Time"))]

# Add DateTime column
data <- cbind(dateTime, data)

# Format dateTime Column
data$dateTime <- as.POSIXct(dateTime)

# Plot
png("plot3.png",height = 480, width = 480)
with(data, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
