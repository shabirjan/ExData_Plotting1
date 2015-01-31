plot4 <- function(){
    fileUrl <- "./data/household_power_consumption.txt"
    data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileUrl), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";",na.strings = "?", header = TRUE,stringsAsFactors=F)
    data$Date <- as.Date(data$Date,format="%d/%m/%Y")
    datetime <- paste(data$Date,data$Time)
    datetime <- as.POSIXct(datetime)
    
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

    with(data, {
        plot(Global_active_power~datetime,type="l",xlab="",ylab="Global Active Power")
        plot(Voltage~datetime, type="l",ylab="Voltage (volt)", xlab="datetime")
        plot(Sub_metering_1~datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
        legend("topright",lty=1, lwd=2, bty="n",,col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power~datetime,type="l",,xlab="datetime",ylab="Global_reactive_power")
        })
    
    dev.copy(png,"plot4.png",height=480, width=480)
    dev.off()
}