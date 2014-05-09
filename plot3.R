## Set a class to convert the date format on reading the file
dmyDate<-setClass("dmyDate")
setAs("character","dmyDate",function(from) as.POSIXct(strptime(from, format="%d/%m/%Y")))
## Read the file and select the date range needed
twodays<-(t1<-read.csv2("household_power_consumption.txt",dec=".",colClasses= c('dmyDate',"character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?"))[t1$Date>strptime("01/31/2007",format="%m/%d/%Y") & t1$Date<strptime("02/03/2007",format="%m/%d/%Y"),]
## Set the time to be a datetime field
twodays$Time<-strptime(paste(as.character(twodays$Date),twodays$Time),format="%F%T")
png(filename="plot3.png")
## Create the plot output
plot(twodays$Time,twodays$Sub_metering_1,type = 'n',xlab="",ylab="Energy sub metering")
points(twodays$Time,twodays$Sub_metering_1,col="black",type="l")
points(twodays$Time,twodays$Sub_metering_2,col="red",type="l")
points(twodays$Time,twodays$Sub_metering_3,col="blue",type="l")
legend("topright",pch=c(NA,NA,NA),text.col="black",lwd=1,lty=(c(1,1,1)),col=(c("black","red","blue")),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()