#Read the text file from the unzipped folder
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = '?')

#Converting from character to double or numeric
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

#Subsetting for two days in february 2007
power_feb_2 <-power[(power$datetime >='2007-02-01') & (power$datetime <'2007-02-03'),]

#To Write the output plot picture into plot1.png file with the dimensions
png(file='plot1.png', width = 480, height = 480)

#Plotting histogram with the labels and red color
hist(power_feb_2$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

#To stop the device reading
dev.off()