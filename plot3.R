HWData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
days <- HWData$Date == "1/2/2007" | HWData$Date == "2/2/2007"
subData <- HWData[days,]

DateTimeStr <- paste(subData$Date, subData$Time)
DateTime <- strptime(DateTimeStr, "%d/%m/%Y %H:%M:00")
subData[["Date_and_Time"]] <- DateTime

with(subData,plot(Date_and_Time, Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "", cex.lab = 0.75, cex.axis = 0.75))
with(subData,lines(Date_and_Time, Sub_metering_1))
with(subData,lines(Date_and_Time, Sub_metering_2, col = "red"))
with(subData,lines(Date_and_Time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

dev.copy(png, file = "plot3.png") 
dev.off()