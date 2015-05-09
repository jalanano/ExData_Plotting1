library(sqldf)
library(lubridate)

mydata <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header=TRUE, sep=";")
mydata$Date<-strptime(paste(mydata$Date, mydata$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=480, height=480, unit="px")
plot(mydata$Date, mydata$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(mydata$Date, mydata$Sub_metering_2, col="red")
lines(mydata$Date, mydata$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1.0, pch="___",col=c("black","red","blue"))
dev.off()
