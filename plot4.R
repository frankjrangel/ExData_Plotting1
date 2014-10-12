#Read the dataframe
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset desired dates
data <-data[which(data[,1]=="2/2/2007" | data[,1]=="1/2/2007"),]

#Set time column
data$mtime <- strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")

#Set numeric values to work with plot()
for (i in 3:9) {data[,i] <- as.numeric(as.character(data[,i]))}

#Set par
par(mfrow = c(2,2))
par("mar" =c(4,4,2.5,2.5))

plot(data$mtime, data[,3], type ="l", ylab ="Global Active Power", xlab ="", cex.axis =.68, cex.lab = .75)
plot(data$mtime, data[,5], type ="l", ylab ="Voltage", xlab ="datetime", cex.axis =.68, cex.lab = .75)
plot(data$mtime, data[,7], type ="n", ylab ="Energy sub metering", xlab ="", cex.axis =.68, cex.lab = .75)
points(data$mtime, data[,7], type ="l", col="black")
points(data$mtime, data[,8], type ="l", col="red")
points(data$mtime, data[,9], type ="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.70, bty="n", xjust = 1, col =c("black","red","blue"), lty = 1)
plot(data$mtime, data[,4], type ="l", ylab ="Global_reactive_power", xlab ="datetime", cex.axis =.68, cex.lab = .75)

#This one I exported directly from Rstudio

