# Read entire data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset required rows
datreq <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert plot data to required class
datetime <- paste(datreq$Date, datreq$Time)
datreq$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
datreq$Sub_metering_1 <- as.numeric(as.character(datreq$Sub_metering_1))
datreq$Sub_metering_2 <- as.numeric(as.character(datreq$Sub_metering_2))
datreq$Sub_metering_3 <- as.numeric(as.character(datreq$Sub_metering_3))

# Plot graph
plot(datreq$DateTime, datreq$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datreq$DateTime, datreq$Sub_metering_2, type = "l", col = "red")
lines(datreq$DateTime, datreq$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6, col = c("black", "red", "blue"), lty = 1)

# Copy png
dev.copy(png, file = "plot3.png")
dev.off()