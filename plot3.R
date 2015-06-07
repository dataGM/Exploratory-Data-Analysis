
###################         PROJET 1 : GRAPHE 3        ######################


dataName <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
xplorData <- read.table(dataName, nrows = 100, sep = ";", header = TRUE)
classes <- sapply(xplorData, class)                                         
powerConsum <- read.table(dataName, skip = 66637, nrows = 2880, header = F,
                          colClasses = classes, sep = ";", check.names=T, 
                          col.names = names(xplorData), na.string = "?")

powerConsum$Date_Heure <- strptime(paste(powerConsum$Date, powerConsum$Time, " ")
                                   , "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px")

with(powerConsum, plot(Date_Heure, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(powerConsum$Date_Heure, powerConsum$Sub_metering_2, type = "l", col = "red")
lines(powerConsum$Date_Heure, powerConsum$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c("black", "red", "blue"), lty = 1)

dev.off()
