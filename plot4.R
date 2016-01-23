## plot2.R ###
## Exploratory Data Analysis Week One Homework ##
## David J. Risius ##

#Set the working directory
setwd("~/Data_Science_Specialization/4_ExploritoryDataAnalysis/data")

#read the file
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

#Adds a new column with date and time and converts them to the date/time format 
power$dateTime <- strptime(paste(power$Date, power$Time), format='%d/%m/%Y %H:%M:%S')

#Converts just the date field to date class
dataVec <- as.Date(power$Date, "%d/%m/%Y")
power$Date <- dataVec #converts the date field to date class
# timeVec <- strptime(power$Time, "%T") #converts the time field to time
# power$Time <- timeVec

##Make the subsetting data set with only 2007-02-01 to 2007-02-02
power2 <- power[power$Date >="2007-02-01" & power$Date<="2007-02-02",]

#Change the column classes to what they should be.  Remember changing  factors to numeric
power2$Global_active_power <- as.numeric(as.character(power2$Global_active_power))
power2$Sub_metering_1 <- as.numeric(as.character(power2$Sub_metering_1))
power2$Sub_metering_2 <- as.numeric(as.character(power2$Sub_metering_2))
power2$Sub_metering_3 <- as.numeric(as.character(power2$Sub_metering_3))
power2$Voltage <- as.numeric(as.character(power2$Voltage))
power2$Global_reactive_power <- as.numeric(as.character(power2$Global_reactive_power))

##Make and save the plot##
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#1st Plot
plot(x = power2$dateTime, y=power2$Global_active_power, type = "n", 
     xlab = "",ylab = "Global Active Power")
lines(x = power2$dateTime, y=power2$Global_active_power)


#2nd Plot
plot(x = power2$dateTime, y=power2$Sub_metering_1, type = "n", 
    xlab = "", ylab = "Energy sub metering")
lines(x = power2$dateTime, y=power2$Sub_metering_1, col = "black")
lines(x = power2$dateTime, y=power2$Sub_metering_2, col = "red")
lines(x = power2$dateTime, y=power2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty='n')

#3rd Plot
plot(x = power2$dateTime, y=power2$Voltage, type = "n", 
     xlab = "datetime", ylab = "Voltage")
lines(x = power2$dateTime, y=power2$Voltage, col = "black")
#4th Plot
plot(x = power2$dateTime, y=power2$Global_reactive_power, type = "n", 
     xlab = "datetime", ylab = "Global_reactive_power")
lines(x = power2$dateTime, y=power2$Global_reactive_power, col = "black")
dev.off()
