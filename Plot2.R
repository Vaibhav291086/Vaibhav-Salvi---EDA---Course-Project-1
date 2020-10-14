
## Plot2.R


#Setting working directory
setwd("//E12-IT-STFS013P/analytics/cms/External/Team Members/VaibhavS/Coursera/Assignment")

Data <- read.table("//E12-IT-STFS013P/analytics/cms/External/Team Members/VaibhavS/Coursera/Assignment/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")


#Tranforming Date & Time from variables to Date/Time classes
subSetData$Date <- as.Date(subSetData$Date, format = "%d/%m/%Y")
subSetData$Time <- strptime(subSetData$Time, format = "%H:%M:%S")

subSetData[1:1440, "Time"] <- format(subSetData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subSetData[1441:2880, "Time"] <- format(subSetData[1441:2880, "Time"], "2007-02-02 %H:%M:%S")


GlobalActivePower <- as.numeric(subSetData$Global_active_power)

##png("plot2.png", width=480, height=480)

plot(subSetData$Time, GlobalActivePower, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

# annotating graph
title(main="Global Active Power Vs Time")

#copying to png
dev.copy(png, filename="plot2.png")

dev.off()
