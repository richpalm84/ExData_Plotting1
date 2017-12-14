setwd("~/Richy's Docs/Data Science Course/exdata%2Fdata%2Fhousehold_power_consumption")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   stringsAsFactors=FALSE, 
                   colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric"))
subdata <- data[66637:69516, ]
subdata <- within(subdata, Datetime <- as.POSIXlt(paste(Date, Time),
                                                  format = "%d/%m/%Y %H:%M:%S"))

#Plot1
hist(subdata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowats)")
dev.copy(png, file="plot1.png")
dev.off()