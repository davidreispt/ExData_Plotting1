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


#plot 3

plot(tbl$DateComplete,tbl$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(tbl$DateComplete,tbl$Sub_metering_2,col="Red")
lines(tbl$DateComplete,tbl$Sub_metering_3,col="Blue")
legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,cex = 0.75, lty=1, col=c('black', 'red', 'blue'))

dev.copy(png,'plot3.png')
dev.off()
