# Set working directory
setwd("C:/Users/vanem/Desktop/DataScienceSpecialization")
#Read file
File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset dates 01/02/2007 and 02/02/2007
subsetFile <- File[File$Date %in% c("1/2/2007","2/2/2007") ,]
#Convert Sub_metering variables as a numeric vectors
Sub_metering_1 <- as.numeric(subsetFile$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetFile$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetFile$Sub_metering_3)
#Convert Data and Time variables to Data\Time classes
datetime <- strptime(paste(subsetFile$Date, subsetFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Open png device, create plot3.png in my working directory
png("plot3.png", width=480, height=480)
#Create a plot and send to a file 
plot(datetime, Sub_metering_1, col = "black",  type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Close the png file device
dev.off()
