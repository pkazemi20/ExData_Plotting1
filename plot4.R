data_1<-read.table(file="household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
data_2<-rbind(subset(data_1, Date == "1/2/2007"),subset(data_1, Date == "2/2/2007"))
png(filename="plot4.png", width = 480, height = 480, units = "px")
data_2$Date <- as.Date(data_2$Date, "%d/%m/%Y")
time <- paste(data_2$Date, data_2$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")
par(mfrow =c(2,2))
#Plot 1
plot(time,as.numeric(data_2$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Plot 2
plot(time,as.numeric(data_2$Voltage), type="l", ylab="Voltage", xlab="datetime")
#Plot 3
plot(time,as.numeric(data_2$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(time,as.numeric(data_2$Sub_metering_2), type="l", ylab="Energy sub metering",col="red", xlab="")
lines(time,as.numeric(data_2$Sub_metering_3), type="l", ylab="Energy sub metering",col="blue", xlab="")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lwd=1, lty=c(1,1,1), col=c("black","red","blue"))
#Plot 4
plot(time,as.numeric(data_2$Global_reactive_power), type="l", ylab="Global_reative_power", xlab="datetime")

dev.off()
