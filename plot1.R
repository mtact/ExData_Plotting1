HWData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
days <- HWData$Date == "1/2/2007" | HWData$Date == "2/2/2007"
subData <- HWData[days,]
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.lab = 0.75, cex.axis = 0.75, cex.main = 0.75 ) 
dev.copy(png, file = "plot1.png")  
dev.off() 