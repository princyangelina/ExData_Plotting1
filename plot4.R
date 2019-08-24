#Read the text file from the unzipped folder
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = '?')

#Converting to numeric data
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

#Date and time column
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- data.frame(power, datetime)

#Subsetting for two days in february 2007
power_feb_2 <-power[(power$datetime >='2007-02-01') & (power$datetime <'2007-02-03'),]

#Plot Frame 
png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

#Plot-1
plot(power_feb_2$datetime, power_feb_2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plot-2
plot(power_feb_2$datetime, power_feb_2$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot-3
plot(power_feb_2$datetime, power_feb_2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_feb_2$datetime, power_feb_2$Sub_metering_2,col="red")
lines(power_feb_2$datetime, power_feb_2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1), bty="n", cex=.5) 

#Plot-4
plot(power_feb_2$datetime, power_feb_2$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")

dev.off()