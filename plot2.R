library(sqldf)
library(lubridate)
mydata <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header=TRUE, sep=";")
mydata$Date<-strptime(paste(mydata$Date, mydata$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png",width=480, height=480, unit="px")
plot(mydata$Date, mydata$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()