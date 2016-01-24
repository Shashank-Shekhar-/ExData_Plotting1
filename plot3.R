## Assigninging url for zip file
my_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Downloading, unzipping and reading the file
temp <- tempfile()
download.file(my_url, temp)
my_file <- read.table(unz(temp,"household_power_consumption.txt"),sep=";",na.strings = "?", header = TRUE)
unlink(temp)
## Extracting data only for required dates
my_data <- subset(my_file, my_file$Date %in% c("1/2/2007","2/2/2007"))
## Removing original file to save memory
rm(my_file)
## Converting date format
my_time <- strptime(paste(my_data$Date,my_data$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S")
## Adding plot to .png file
png("plot3.png", width=480, height=480)
plot(my_time, my_data$Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(my_time, my_data$Sub_metering_2,col = "red")
lines(my_time, my_data$Sub_metering_3,col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()