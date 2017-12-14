setwd("~/Richy's Docs/Data Science Course/exdata%2Fdata%2Fhousehold_power_consumption")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   stringsAsFactors=FALSE, 
                   colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric"))
subdata <- data[66637:69516, ]
subdata <- within(subdata, Datetime <- as.POSIXlt(paste(Date, Time),
                                                  format = "%d/%m/%Y %H:%M:%S"))

#Plot2
plot(subdata$Datetime, subdata$Global_active_power, 
     type = "l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()