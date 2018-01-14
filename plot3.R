############################################################
# Course   : Data Science Specialization: 
# EDA      : project 1
# file name: plot3.R
# plot name: plot3.PNG 
# Name     : Nagaraju Aswadhati

## load the data
power <- read.table("household_power_consumption.txt",
                    header = T, 
                    sep = ";", 
                    na.strings = "?")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- 
  format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- 
  format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
attach(subpower)
plot(subpower$Time,
     subpower$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")

with(subpower,
     lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,
     lines(Time,as.numeric(as.character(Sub_metering_2)),
           col="red"))
with(subpower,
     lines(Time,as.numeric(as.character(Sub_metering_3)),
           col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

# Save plot3.PNG
dev.copy(png, 
         file = "plot3.png", 
         height = 480, 
         width = 480)
dev.off()
detach(subpower)

#######################################################