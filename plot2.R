#### FOR PLOT2###
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
#
#                       Plot 2 Single Line Graph
#
#
## Preparing the axes
#
data_dates$Index=1:nrow(data_dates)
beg_fri=nrow(data_dates[data_dates$Weekdays=="Thu",])
a=data_dates[beg_fri+1,"Weekdays"]
b=data_dates[nrow(data_dates),"Weekdays"]
c=data_dates[1,"Weekdays"]
# head(data_dates)
#
## Plotting the initial data
#
plot(data_dates$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n",cex.lab=0.75)
#
## Plotting the axes
#
at=c(1,beg_fri+1,nrow(data_dates));labels=c(c,a,b)
axis(1,at,labels,cex.axis=0.8)
# time_vals=data_dates$Index
# Now we add the plot file as a png to the wd directory by using a device
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()
#