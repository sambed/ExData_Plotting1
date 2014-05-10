install.packages('sqldf')
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myfile,mySql,sep=';')
myData$DateTime <- as.POSIXlt(strptime(paste(myData$Date,myData$Time), "%d/%m/%Y %H:%M:%S"))

png("plot2.png",480,480)
plot(myData$DateTime,myData$Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')
graphics.off()

