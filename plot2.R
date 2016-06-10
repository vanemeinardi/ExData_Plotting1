# Set working directory
setwd("C:/Users/vanem/Desktop/DataScienceSpecialization")
#Read file
File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset dates 01/02/2007 and 02/02/2007
subsetFile <- File[File$Date %in% c("1/2/2007","2/2/2007") ,]
#Convert Global_active_power as a numeric vector
globalActivePower <- as.numeric(subsetFile$Global_active_power)
#Convert Data and Time variables to Data\Time classes
datetime <- strptime(paste(subsetFile$Date, subsetFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Open png device, create plot2.png in my working directory
png("plot2.png", width=480, height=480)
#Create a plot and send to a file 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close the png file device
dev.off()
