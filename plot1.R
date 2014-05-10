#### FOR PLOT1###
#
#                      READING IN THE DATA 
#
setwd("~/Coursera/Data_Scientist_Specialization/Exploratory_Data_Analysis/Week_1/Project_Prog_Data")
data=read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
#
##          GETTING THE DATA FRAME RIGHT CLEANING THE DATA 
data2=complete.cases(data)
data3=data[data2,]
head(data3)
data_dates=data3[data3$Date=="1/2/2007" | data3$Date =="2/2/2007",]
data_date_p1=data.frame(data3[data3$Date=="3/2/2007",][1,])
data_dates=rbind(data_dates,data_date_p1)
# head(data_dates,100)
# str(data_dates)
# unique(data_dates$Date)
#x=strptime(data_dates$Time,'%H:%M:%S')  NOT SURE OW TO USE THIS 
data_dates$Date=as.Date(data_dates$Date,"%d/%m/%Y")
data_dates$Weekdays=weekdays(data_dates$Date)
data_dates$Weekdays=gsub("Friday","Fri",data_dates$Weekdays)
data_dates$Weekdays=gsub("Thursday","Thu",data_dates$Weekdays)
data_dates$Weekdays=gsub("Saturday","Sat",data_dates$Weekdays)
#
## 
##                      PLOT 1 HISTOGRAM
#
hist(data_dates$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
