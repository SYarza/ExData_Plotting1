library(dplyr)
library(lubridate)
library(grDevices)

hpd<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpd<-hpd %>%
  mutate(Date=dmy(as.character(Date))) %>%
  filter(day(Date)==1|day(Date)==2) %>%
  filter(month(Date)==2) %>%
  filter(year(Date)==2007) %>%
  mutate(Global_active_power=as.numeric(as.character(Global_active_power))) %>%
  filter(Global_active_power!="?")
png("plot1.png",width=480,height=480)
with(hpd,hist(Global_active_power,main="Global Active Power",
              xlab="Global Active Power (kilowatts)",col="red"))
dev.off()