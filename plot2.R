library("data.table")
# Load the txt file and subset as required 
power_cons<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_cons) <- c("Date","Time","Global Active Power","Global Reactive Power","Voltage","Global Intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data<-subset(power_cons,Date=="1/2/2007"|Date=="2/2/2007")

# Create a new date variable that merges Date and Time in a POSIXct format 
data$Newdate<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")

# Convert data class to numeric
data$`Global Active Power`<-as.numeric(as.character(data$`Global Active Power`))

# Make plot 2
plot(data$Newdate,data$`Global Active Power`,type="l",xlab="",ylab="Global Active Power (kilowatts)") 





