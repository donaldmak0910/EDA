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

png(filename="plot1.png",width=500, height=500)
hist(power$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")
dev.off()