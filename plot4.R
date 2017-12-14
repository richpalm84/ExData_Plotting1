setwd("~/Richy's Docs/Data Science Course/exdata%2Fdata%2Fhousehold_power_consumption")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   stringsAsFactors=FALSE, 
                   colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric"))
subdata <- data[66637:69516, ]
subdata <- within(subdata, Datetime <- as.POSIXlt(paste(Date, Time),
                                                  format = "%d/%m/%Y %H:%M:%S"))

#Plot4
par(mfrow=c(2,2))
plot(subdata$Datetime, subdata$Global_active_power, 
     type = "l",ylab="Global Active Power (kilowatts)", xlab="")

plot(subdata$Datetime, subdata$Voltage, 
     type = "l",ylab="Voltage", xlab="datetime")

plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subdata$Datetime, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$Datetime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 0.5)

plot(subdata$Datetime, subdata$Global_reactive_power, 
     type = "l",ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()