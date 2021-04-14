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
png("plot2.png",width=480,height=480)
with(hpd,plot(DateTime,Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",
              xlab=""))
dev.off()