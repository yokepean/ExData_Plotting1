# Read entire data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset required rows
datreq <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert plot data to required class
datetime <- paste(datreq$Date, datreq$Time)
datreq$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
datreq$Global_active_power <- as.numeric(as.character(datreq$Global_active_power))

# Plot graph
plot(datreq$DateTime, datreq$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilotwatts)")

# Copy png
dev.copy(png, file = "plot2.png")
dev.off()