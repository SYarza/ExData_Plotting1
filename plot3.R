library(dplyr)
library(lubridate)
library(grDevices)

hpd<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
hpd<-hpd %>%
  mutate(Date=dmy(Date)) %>%
  filter(day(Date)<3) %>%
  filter(month(Date)==2) %>%
  filter(year(Date)==2007) %>%
  mutate(DateTime=paste(Date,Time)) %>%
  mutate(DateTime=strptime(DateTime,"%Y-%m-%d %H:%M:%S"))
png("plot3.png",width=480,height=480)
with(hpd,plot(DateTime,Sub_metering_1,type = "l",ylab="Energy sub metering",xlab=""))
with(hpd,points(DateTime,Sub_metering_2,type = "l",col="red"))
with(hpd,points(DateTime,Sub_metering_3,type = "l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = c(1,1,1))
dev.off()