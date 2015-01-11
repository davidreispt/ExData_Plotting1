tbl=read.table("household_power_consumption.txt", sep = ";",header = TRUE)

tbl[,1] = as.Date(tbl[,1], "%d/%m/%Y")

tbl = tbl[ which(tbl$Date=='2007-02-01' | tbl$Date=='2007-02-02'), ]

tbl$Global_active_power = as.numeric(as.character(tbl$Global_active_power))
tbl$DateComplete = as.POSIXlt(paste(tbl$Date,tbl$Time))
tbl$Sub_metering_1 = as.numeric(as.character(tbl$Sub_metering_1))
tbl$Sub_metering_2 = as.numeric(as.character(tbl$Sub_metering_2))
tbl$Sub_metering_3 = as.numeric(as.character(tbl$Sub_metering_3))
tbl$Voltage = as.numeric(as.character(tbl$Voltage))
tbl$Global_reactive_power = as.numeric(as.character(tbl$Global_reactive_power))

#480px X 480px Linux window
x11( width = 6.4, height = 6.4)

#plot 2
plot(tbl$DateComplete,tbl$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,'plot2.png')
dev.off()