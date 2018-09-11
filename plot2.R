#load libraries
library(dplyr)
library(magrittr)
#read data file (the file was downloaded and unzipped in the working directory)
df <-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Concatenate Date and Time
df$DT <- paste(df$Date,df$Time)
#Change date format to select the sample
df %<>%
  + mutate(Date=as.Date(Date, format = "%d/%m/%Y"))
#Getting the records for dates higher or equal to 2007-02-01 and lower or equal to 2007-02-02
mydata <- subset(df, Date >= as.Date("2007-02-01"))
mydata <- subset(mydata, Date <= as.Date("2007-02-02"))
#free df from memory since we do not need it anymore
rm(df)
#Convert DT to POSIXct
mydata %<>%mutate(DT=as.POSIXct(DT,format="%d/%m/%Y %H:%M:%S"))
#open the png device with width and height params
png(file="plot2
    .png",width=480,height=480)
#make the line graph
plot(mydata$DT, mydata$Global_active_power, typ = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
#close the device
dev.off()
