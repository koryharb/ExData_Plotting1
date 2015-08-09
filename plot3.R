dat<-read.table('Data/household_power_consumption.txt', header = TRUE ,sep = ";")
subdat<- subset(dat,dat$Date %in% c("1/2/2007", "2/2/2007"))
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)

dt <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subdat$Sub_metering_1 <- as.numeric(subdat$Sub_metering_1)
subdat$Sub_metering_2 <- as.numeric(subdat$Sub_metering_2)
subdat$Sub_metering_3 <- as.numeric(subdat$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(dt,subdat$Sub_metering_1,type="l", xlab = "", ylab = "Energy Submetering")
lines(dt,subdat$Sub_metering_2, type = "l", col = "red")
lines(dt, subdat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
