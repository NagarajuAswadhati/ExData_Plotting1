############################################################
# Course   : Data Science Specialization: 
# EDA      : project 1
# file name: plot2.R
# plot name: plot2.PNG 
# Name     : Nagaraju Aswadhati

## load the data
power <- read.table("household_power_consumption.txt",
                    header = T, 
                    sep = ";", 
                    na.strings = "?")

subpower <- 
  subset(power, 
         power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- 
  format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- 
  format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot function
attach(subpower)
plot(subpower$Time,
     as.numeric(as.character(subpower$Global_active_power)),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

# Save plot2.PNG
dev.copy(png, 
         file = "plot2.png", 
         height = 480, 
         width = 480)
dev.off()
detach(subpower)

############################################################