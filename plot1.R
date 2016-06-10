# Set working directory
setwd("C:/Users/vanem/Desktop/DataScienceSpecialization")
#Read file
File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Subset dates 01/02/2007 and 02/02/2007
subsetFile <- File[File$Date %in% c("1/2/2007","2/2/2007") ,]
#Convert Global_active_power as a numeric vector
globalActivePower <- as.numeric(subsetFile$Global_active_power)
#Open png device, create plot1.png in my working directory
png("plot1.png", width=480, height=480)
#Create a histogram and send to a file 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Annotate plot
title(main = "Global Active Power")
#Close the png file device
dev.off()
