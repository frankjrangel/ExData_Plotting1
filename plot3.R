#Read the dataframe
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset desired dates
data <-data[which(data[,1]=="2/2/2007" | data[,1]=="1/2/2007"),]

#Set time column
data$mtime <- strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")

#Set numeric values to work with plot()
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Open device and plot data
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(data$mtime, data$Sub_metering_1, type ="n", ylab ="Energy sub metering", xlab ="", cex.axis =.68, cex.lab = .75)
points(data$mtime, data$Sub_metering_1, type ="l", col="black")
points(data$mtime, data$Sub_metering_2, type ="l", col="red")
points(data$mtime, data$Sub_metering_3, type ="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.70, col =c("black","red","blue"), lty = 1)

dev.off()