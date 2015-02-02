plot2 <- function()
{
    fileUrl <- "./data/household_power_consumption.txt"
    data <- read.table(text = grep("^[1,2]/2/2007", readLines(fileUrl), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";",na.strings = "?", header = TRUE,stringsAsFactors=F)
    data$Date <- as.Date(data$Date,format="%d/%m/%Y")
    datetime <-as.POSIXct(paste(data$Date,data$Time))

    plot(data$Global_active_power~datetime,type="l",xlab="",ylab="Global Active Power(kilowatts")
    dev.copy(png,file="plot2.png")
    dev.off()
}