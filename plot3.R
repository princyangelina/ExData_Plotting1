#Read the text file from the unzipped folder
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = '?')

#Converting to numeric data
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

#Date and time column
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- data.frame(power, datetime)

#Subsetting for two days in february 2007
power_feb_2 <-power[(power$datetime >='2007-02-01') & (power$datetime <'2007-02-03'),]

#To Write the output plot picture into plot1.png file with the dimensions
png(filename = 'plot3.png', width = 480, height = 480)

#Plotting
plot(power_feb_2$datetime, power_feb_2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_feb_2$datetime, power_feb_2$Sub_metering_2,col="red")
lines(power_feb_2$datetime, power_feb_2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
