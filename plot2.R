#Read the dataframe
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset desired dates
data <-data[which(data[,1]=="2/2/2007" | data[,1]=="1/2/2007"),]

#Set time column
data$mtime <- strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")

#Set numeric values to work with plot()
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Set par
par(mfrow = c(1,1))

#Open device and plot data
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data$mtime, data$Global_active_power, type ="l", ylab ="Global Active Power (kilowatts)", xlab ="", cex.axis =.68, cex.lab = .75)

dev.off()