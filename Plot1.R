## Plot1.R


#Setting working directory
setwd("//E12-IT-STFS013P/analytics/cms/External/Team Members/VaibhavS/Coursera/Assignment")

Data <- read.table("//E12-IT-STFS013P/analytics/cms/External/Team Members/VaibhavS/Coursera/Assignment/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")


GlobalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(GlobalActivePower, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, filename = "Plot1.png")

dev.off()
