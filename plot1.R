
#plot 1

setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana1/teste")

#Local File
dir = file('./exdata_data_household_power_consumption/household_power_consumption.txt')

library(dplyr)

banco = read.table(text = grep("^[1,2]/2/2007",readLines(dir),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

head(banco)

png(filename='plot1.png', width=480, height=480, units='px')

windows()

hist(as.numeric(banco$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")





