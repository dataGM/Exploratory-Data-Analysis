
####################            PROJET 1 : GRAPHE 1         ####################


dataName <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
xplorData <- read.table(dataName, nrows = 100, sep = ";", header = TRUE)
classes <- sapply(xplorData, class)                                         
powerConsum <- read.table(dataName, skip = 66637, nrows = 2880, header = F,
                          colClasses = classes, sep = ";", check.names=T, 
                          col.names = names(xplorData), na.string = "?")


png("plot1.png", width = 480, height = 480, units = "px")
hist(powerConsum$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "Orangered")
dev.off()

