#Read the text file from the unzipped folder
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = '?')

#Converting to numeric data
power$Global_active_power <- as.numeric(power$Global_active_power)

#Date and time column
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- data.frame(power, datetime)

#Subsetting for two days in february 2007
power_feb_2 <-power[(power$datetime >='2007-02-01') & (power$datetime <'2007-02-03'),]

#To Write the output plot picture into plot1.png file with the dimensions
png(filename = 'plot2.png', width = 480, height = 480)

#Plotting
plot(x = power_feb_2$datetime, y = power_feb_2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#To stop the device reading
dev.off()