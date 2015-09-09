HWData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
days <- HWData$Date == "1/2/2007" | HWData$Date == "2/2/2007"
subData <- HWData[days,]

DateTimeStr <- paste(subData$Date, subData$Time)
DateTime <- strptime(daytimeStr, "%d/%m/%Y %H:%M:00")
subData[["Date_and_Time"]] <- DateTime

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(subData,plot(Date_and_Time, Global_active_power,type = "n", ylab = "Global Active Power", xlab = "", cex.lab = 0.75, cex.axis = 0.75)) 
with(subData,lines(Date_and_Time, Global_active_power))

with(subData,plot(Date_and_Time, Voltage,type = "n", ylab = "Voltage", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75)) 
with(subData,lines(Date_and_Time, Voltage))

with(subData, plot(Date_and_Time, Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "", cex.lab = 0.75, cex.axis = 0.75))  
with(subData,lines(Date_and_Time, Sub_metering_1))
with(subData,lines(Date_and_Time, Sub_metering_2, col = "red"))
with(subData,lines(Date_and_Time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6, bty = "n")

with(subData,plot(Date_and_Time, Global_reactive_power,type = "n", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75))  
with(subData,lines(Date_and_Time, Global_reactive_power))

dev.copy(png, file = "plot4.png")  
dev.off() 