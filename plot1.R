library(sqldf)

mydata <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header=TRUE, sep=";")

png(file="plot1.png",width=480, height=480, unit="px")
hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "RED")
dev.off()