## Read household power data
readData <- read.table('household_power_consumption.txt', header=T, sep=';', 
na.strings='?', quote='\"')

readData$Date <- as.Date(readData$Date, format='%d/%m/%Y')
## Subset data and convert dates/time to datetime
subsetData <- subset(readData, subset=(Date == '2007-02-01' 
| Date == '2007-02-02'))

rm(readData)

datetime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(datetime)
## Create and save plot
with(subsetData, {
  plot(Sub_metering_1~Datetime, type='l',
       ylab='Energy sub metering', xlab='')
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend('topright', col=c('black', 'red', 'blue'), lty=1, lwd=2, 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.copy(png, file='plot3.png', height=480, width=480)

dev.off()