plot3 <- function(){
    fileUrl <- "./data/household_power_consumption.txt"
    data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileUrl), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";",na.strings = "?", header = TRUE,stringsAsFactors=F)
    data$Date <- as.Date(data$Date,format="%d/%m/%Y")
    datetime <-as.POSIXct(paste(data$Date,data$Time))
    png("plot3.png",height=480, width=480)
    with(data, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
        legend("topright",lwd=1,col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    })
    
    
    dev.off()
}
