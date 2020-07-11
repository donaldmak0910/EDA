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

png(filename="plot3.png",width=500, height=500)
plot(x=power$date_conv,y=power$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=power$date_conv,y=power$Sub_metering_2, col='red')
lines(x=power$date_conv,y=power$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1)


dev.off()