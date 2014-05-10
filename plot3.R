#### FOR PLOT3###
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
# #         Plot 3 Multiple Line Graphs

## Preparing the axes
#
data_dates$Index=1:nrow(data_dates)
beg_fri=nrow(data_dates[data_dates$Weekdays=="Thu",])
a=data_dates[beg_fri+1,"Weekdays"]
b=data_dates[nrow(data_dates),"Weekdays"]
c=data_dates[1,"Weekdays"]
#
#   Plotting the GrapH
metering=as.matrix(data_dates[,7:9])
COLORS=c("black","red","blue")
LINE.TYPES=c("solid","solid","solid")
matplot(metering,type="l",col=COLORS,lty=LINE.TYPES,ylab="Energy sub metering",xaxt="n")
#
#  Adding the axes and legend 
at=c(1,beg_fri+1,nrow(data_dates));labels=c(c,a,b)
axis(1,at,labels)
legend("topright",inset=0.001,
       c("Sub_metering_1", "Sub_metering_2",
         "Sub_metering_3"),col = COLORS, lty = LINE.TYPES)
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()




