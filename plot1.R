#Read the dataframe
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Set date column
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

#Set time column
x <- strptime(data[,2], "%H:%M:%S")
data[,2] <- strftime(x, "%H:%M:%S")

#Subset desired dates
x <- data[data[,1] == "2007-02-01",]
y <- data[data[,1] == "2007-02-02",]

#Merge for final dataset
data <- rbind(x, y)

#Set numeric values to work with hist()
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Set par
par(mfrow = c(1,1))

#Open device and plot data
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
