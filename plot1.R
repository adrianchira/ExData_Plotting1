#load libraries
library(dplyr)
library(magrittr)
#read data file (the file was downloaded and unzipped in the working directory)
df <-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Change date format
df %<>%
+ mutate(Date=as.Date(Date, format = "%d/%m/%Y"))
#Getting the records for dates higher or equal to 2007-02-01 and lower or equal to 2007-02-02
mydata <- subset(df, Date >= as.Date("2007-02-01"))
mydata <- subset(mydata, Date <= as.Date("2007-02-02"))
#free df from memory since we do not need it anymore
rm(df)
#open the png device with width and height params
png(file="plot1.png",width=480,height=480)
#make the histogram
hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#close the device
dev.off()
