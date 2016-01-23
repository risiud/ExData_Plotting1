## Exploratory Data Analysis Week One Homework ##
## David J. Risius ##

#Set the working directory
setwd("~/Data_Science_Specialization/4_ExploritoryDataAnalysis/data")

#read the file
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
dataVec <- as.Date(power$Date, "%d/%m/%Y")
power$Date <- dataVec #converts the date field to date class
timeVec <- strptime(power$Time, "%T") #converts the time field to time
power$Time <- timeVec

##Make the subsetting data set with only 2007-02-01 to 2007-02-02
power2 <- power[power$Date >="2007-02-01" & power$Date<="2007-02-02",]

#Change the column classes to what they should be
power2$Global_active_power <- as.numeric(as.character(power2$Global_active_power))
power2$Sub_metering_1 <- as.numeric(as.character(power2$Sub_metering_1))
power2$Sub_metering_2 <- as.numeric(as.character(power2$Sub_metering_2))
power2$Sub_metering_3 <- as.numeric(as.character(power2$Sub_metering_3))
power2$Voltage <- as.numeric(as.character(power2$Voltage))
power2$Global_reactive_power <- as.numeric(as.character(power2$Global_reactive_power))

#Construct the Histogram
Global_active_power <- power2$Global_active_power/1000

##Make and save the plot##
png(file = "plot1.png", width = 480, height = 480)
hist(power2$Global_active_power, main = "Global Active Power",
        col = "red", xlab = "Global Active Power (kw)", xlim = c(0,6), ylim = c(1,1200))
title(main = "Global Active Power")
dev.off()
