install.packages('sqldf')
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myfile,mySql,sep=';')
myData$DateTime <- as.POSIXlt(strptime(paste(myData$Date,myData$Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png",480,480)
par(mfcol=c(2,2))
plot(myData$DateTime,myData$Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')

plot(myData$DateTime,myData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering',col='black')
lines(myData$DateTime,myData$Sub_metering_2,type='l',col='red')
lines(myData$DateTime,myData$Sub_metering_3,type='l',col='blue')
legend('topright',pch='-',bty='n',col=c('Black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(myData$DateTime,myData$Voltage,type='l',xlab='datetime',ylab='Voltage')
plot(myData$DateTime,myData$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
graphics.off()
