## Read power consmption data
readData <- read.table('household_power_consumption.txt', header=T, sep=';', na.strings='?', quote='\"')

readData$Date <- as.Date(readData$Date, format='%d/%m/%Y')
## Subset data and convert dates to datetime
subsetData <- subset(readData, subset=(Date == '2007-02-01' 
| Date == '2007-02-02'))

rm(readData)

datetime <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(datetime)
## Create and save plot
plot(subsetData$Global_active_power~subsetData$Datetime, type='l',
     ylab='Global Active Power (kilowatts)', xlab='')
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()