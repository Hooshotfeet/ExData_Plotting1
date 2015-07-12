#Create Data File from downloaded data set

    dataFile <- "household_power_consumption.txt"
    
#Read and Subset Data    
    data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
#str, subset data
#Convert data and time variables to date/time classes

    datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(subSetData$Global_active_power)

#Create png and plot specified data    
    png("plot2.png", width=480, height=480)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()