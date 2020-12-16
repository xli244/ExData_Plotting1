library("data.table")
# Load the txt file and subset as required 
power_cons<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_cons) <- c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-subset(power_cons,Date=="1/2/2007"|Date=="2/2/2007")

# Create a new date variable that merges Date and Time in a POSIXct format 
data$Newdate<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")

# Convert data class to numeric
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$`Global Active Power`<-as.numeric(as.character(data$`Global Active Power`))
data$`Global Reactive Power`<-as.numeric(as.character(data$`Global Reactive Power`))
# Make plot 4
par(mfrow=c(2,2))
#1
plot(data$Newdate,data$`Global Active Power`,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
#2
plot(data$Newdate,data$Voltage,type="l",xlab="datetime",ylab="Voltage") 
#3
plot(data$Newdate,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering") 
lines(data$Newdate,data$Sub_metering_1,type="l",xlab="",ylab="",col="black")
lines(data$Newdate,data$Sub_metering_2,type="l",xlab="",ylab="",col="red")
lines(data$Newdate,data$Sub_metering_3,type="l",xlab="",ylab="",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.3)
#4
plot(data$Newdate,data$`Global Reactive Power`,type="l",xlab="",ylab="Global Reactive Power (kilowatts)")



