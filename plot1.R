## Read power consumption data
readData <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                       na.strings='?', quote='\"')
## Subset data
subsetData <- subset(readData, subset=(Date == '1/2/2007' | Date == '2/2/2007'))

rm(readData)
## Create and save histogram
hist(subsetData$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', ylab='Frequency', col='Red')

dev.copy(png, file='plot1.png', height=480, width=480)

dev.off()