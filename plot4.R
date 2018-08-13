
#plot 4

setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana1/teste")

#Local File
dir = file('./exdata_data_household_power_consumption/household_power_consumption.txt')

library(dplyr)

banco = read.table(text = grep("^[1,2]/2/2007",readLines(dir),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

png(filename='plot4.png', width=480, height=480, units='px')

banco$Date = as.Date(banco$Date, format = '%d/%m/%Y')
banco$DateTime = as.POSIXct(paste(banco$Date, banco$Time))

windows()

par(mfrow = c(2, 2))

plot(banco$DateTime, banco$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')

plot(banco$DateTime, banco$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')

plot(banco$DateTime, banco$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')

lines(banco$DateTime, banco$Sub_metering_2, col = 'red')

lines(banco$DateTime, banco$Sub_metering_3, col = 'blue')

legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

plot(banco$DateTime, banco$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
