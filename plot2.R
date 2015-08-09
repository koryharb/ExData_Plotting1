dat<-read.table('Data/household_power_consumption.txt', header = TRUE ,sep = ";")
subdat<- subset(dat,dat$Date %in% c("1/2/2007", "2/2/2007"))
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)

dt <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(dt,subdat$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

