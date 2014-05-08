# Read entire data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset required rows
datreq <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert plot data to required class
datreq$Global_active_power <- as.numeric(as.character(datreq$Global_active_power))

# Plot histogram
hist(datreq$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy png
dev.copy(png, file = "plot1.png")
dev.off()