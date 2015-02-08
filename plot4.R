## Read power consumption data and convert dates
readData <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
na.strings='?', quote='\"')

readData$Date <- as.Date(readData$Date, format='%d/%m/%Y')
## Subset data and convert date/time to datetime
subsetData <- subset(readData, subset=(Date == '2007-02-02' | Date == '2007-02-01'))

rm(readData)

datetime <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(datetime)
##Create and save plot
par(mfrow=c(2,2), mai=c(0.1, 0.1, 0.1), mar=c(0,0,0,0), oma=c(0,0,0,0), pin=c(2,2))

with(subsetData, {
  plot(Global_active_power~Datetime, type='l', 
       ylab='Global Active Power', xlab='')
  
  plot(Voltage~Datetime, type='l', 
       ylab='Voltage', xlab='datetime')
  
  plot(Sub_metering_1~Datetime, type='l', 
       ylab='Global Active Power', xlab='')
  
  lines(Sub_metering_2~Datetime,col='Red')
  
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend('topright', col=c('black', 'red', 'blue'), lty=1, lwd=2, bty='n',
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex=0.6)
  
  plot(Global_reactive_power~Datetime, type='l', 
       ylab='Global_reactive_power',xlab='datetime')
})

dev.copy(png, file='plot4.png', height=480, width=480)

dev.off()