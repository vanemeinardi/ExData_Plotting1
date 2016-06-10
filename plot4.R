# Set working directory
setwd("C:/Users/vanem/Desktop/DataScienceSpecialization")
#Read file
File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset dates 01/02/2007 and 02/02/2007
subsetFile <- File[File$Date %in% c("1/2/2007","2/2/2007") ,]
#Convert Global_active_power, Voltage and Sub_metering variables as numeric vectors
globalActivePower <- as.numeric(subsetFile$Global_active_power)
voltage <- as.numeric(subsetFile$Voltage)
Sub_metering_1 <- as.numeric(subsetFile$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetFile$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetFile$Sub_metering_3)
globalReactivePower <- as.numeric(subsetFile$Global_reactive_power)
#Convert Data and Time variables to Data\Time classes
datetime <- strptime(paste(subsetFile$Date, subsetFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Open png device, create plot4.png in my working directory
png("plot4.png", width=480, height=480)
#Create a plot and send to a file 
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering_1, col = "black",  type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
#Close the png file device
dev.off()
