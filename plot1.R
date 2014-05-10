install.packages('sqldf')
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myfile,mySql,sep=';')
myData$DateTime <- as.POSIXct(strptime(paste(myData$Date,myData$Time), "%d/%m/%Y %H:%M:%S"))

png("plot1.png",480,480)
hist(myData$Global_active_power,col='Red',xlab='Global Active Power (kilowatts)',ylab='Frequency', main='Global Active Power')
graphics.off()