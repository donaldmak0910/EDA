temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
power <- read.table(unz(temp,"household_power_consumption.txt"), 
                    sep=";", 
                    header = T, 
                    na="?", 
                    colClasses = c("character",
                                   'character',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric'))

unlink(temp)


power <- power[which(power$Date == '2/2/2007' | power$Date=='1/2/2007'),]
power$date_conv <-as.POSIXlt.character(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=500, height=500)
par(mfrow=c(2,2))
plot(x=power$date_conv ,y=power$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power')
plot(x=power$date_conv ,y=power$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=power$date_conv,y=power$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=power$date_conv,y=power$Sub_metering_2, col='red')
lines(x=power$date_conv,y=power$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n", col = c('black','red','blue'))
plot(x=power$date_conv ,y=power$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')


dev.off()