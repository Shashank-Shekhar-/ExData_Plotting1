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
## Adding plot to .png file
png("plot1.png", width=480, height=480)
with(my_data, hist(Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
