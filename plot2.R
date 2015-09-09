HWData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
days <- HWData$Date == "1/2/2007" | HWData$Date == "2/2/2007"
subData <- HWData[days,]

DateTimeStr <- paste(subData$Date, subData$Time)
DateTime <- strptime(daytimeStr, "%d/%m/%Y %H:%M:00")
subData[["Date_and_Time"]] <- DateTime

with(subData,plot(Date_and_Time, Global_active_power,type = "n", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.75, cex.axis = 0.75))  
with(subData,lines(Date_and_Time, Global_active_power))
dev.copy(png, file = "plot2.png") 
dev.off() 