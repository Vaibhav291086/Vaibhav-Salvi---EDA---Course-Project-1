
## Plot3.R

setwd("D:/VAIBHAV/WTW/Coursera/Assignment")

Data <- read.table("D:/VAIBHAV/WTW/Coursera/Assignment/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

#Tranforming Date & Time from variables to Date/Time classes
subSetData$Date <- as.Date(subSetData$Date, format = "%d/%m/%Y")
subSetData$Time <- strptime(subSetData$Time, format = "%H:%M:%S")

subSetData[1:1440, "Time"] <- format(subSetData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subSetData[1441:2880, "Time"] <- format(subSetData[1441:2880, "Time"], "2007-02-02 %H:%M:%S")


GlobalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##png("plot3.png", width=480, height=480)

##Basic plot function
plot(subSetData$Time, subMetering1, type="l", xlab="", ylab="Energy sub metering")
## Make Plot appear on screen device 
with(subSetData, lines(subSetData$Time, subMetering1))
with(subSetData, lines(subSetData$Time, subMetering2, col="red"))
with(subSetData, lines(subSetData$Time, subMetering3, col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## Annotate with a Title
title(main="Energy sub metering vs Time")

#copy my plot to a png file
dev.copy(png, file = "plot3.png")

dev.off()
