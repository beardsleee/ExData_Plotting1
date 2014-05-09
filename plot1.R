## Set a class to convert the date format on reading the file
dmyDate<-setClass("dmyDate")
setAs("character","dmyDate",function(from) as.POSIXct(strptime(from, format="%d/%m/%Y")))
## Read the file and select the date range needed
twodays<-(t1<-read.csv2("household_power_consumption.txt",dec=".",colClasses= c('dmyDate',"character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?"))[t1$Date>strptime("01/31/2007",format="%m/%d/%Y") & t1$Date<strptime("02/03/2007",format="%m/%d/%Y"),]
png(filename="plot1.png")
## Create the plot output
hist(twodays$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()