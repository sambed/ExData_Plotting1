install.packages('sqldf')
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myfile,mySql,sep=';')
myData$DateTime <- as.POSIXlt(strptime(paste(myData$Date,myData$Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png",480,480)
plot(myData$DateTime,myData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering',col='black')
lines(myData$DateTime,myData$Sub_metering_2,type='l',col='red')
lines(myData$DateTime,myData$Sub_metering_3,type='l',col='blue')
legend('topright',pch='-',col=c('Black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
graphics.off()


