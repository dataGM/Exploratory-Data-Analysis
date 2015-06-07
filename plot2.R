
###################         PROJET 1 : GRAPHE 2        ######################


dataName <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
xplorData <- read.table(dataName, nrows = 100, sep = ";", header = TRUE)
classes <- sapply(xplorData, class)                                         
powerConsum <- read.table(dataName, skip = 66637, nrows = 2880, header = F,
                          colClasses = classes, sep = ";", check.names=T, 
                          col.names = names(xplorData), na.string = "?")

powerConsum$Date_Heure <- strptime(paste(powerConsum$Date, powerConsum$Time, " ")
                                   , "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")
with(powerConsum, plot(Date_Heure, Global_active_power, xlab = "", type = "l", 
                       ylab = "Global Active Power (kilowatts)"))
dev.off()
