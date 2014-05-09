## Set a class to convert the date format on reading the file
dmyDate<-setClass("dmyDate")
setAs("character","dmyDate",function(from) as.POSIXct(strptime(from, format="%d/%m/%Y")))
## Read the file and select the date range needed
twodays<-(t1<-read.csv2("household_power_consumption.txt",dec=".",colClasses= c('dmyDate',"character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?"))[t1$Date>strptime("01/31/2007",format="%m/%d/%Y") & t1$Date<strptime("02/03/2007",format="%m/%d/%Y"),]
twodays$Time<-strptime(paste(as.character(twodays$Date),twodays$Time),format="%F%T")
png(filename="plot2.png")
## Create the plot output
plot(twodays$Time,twodays$Global_active_power,type = 'l',col="black",xlab="",ylab="Global Active Power (kilowatts)",col.axis="black")
dev.off()