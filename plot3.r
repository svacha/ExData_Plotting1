setwd("~/Projects/ExData_Plotting1")

## Assuming the data in the zip file has been unzipped to a file `household_power_consumption.txt`
hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=";")

## Grab the subset of the data for the dates: 2007-02-01 and 2007-02-02
## In the raw data, Date is in format dd/mm/yyyy.
two_day_hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

two_day_hpc$datetime = strptime(paste(two_day_hpc$Date, two_day_hpc$Time), format = "%e/%m/%Y %T")

sub1 <- as.numeric(as.character(two_day_hpc$Sub_metering_1)) 
sub2 <- as.numeric(as.character(two_day_hpc$Sub_metering_2)) 
sub3 <- as.numeric(as.character(two_day_hpc$Sub_metering_3)) 

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(two_day_hpc$datetime, sub1, xlab = "", ylab = "Energy sub metering", main = "", type="l", col = "black")
points(two_day_hpc$datetime, sub2, type="l", col = "red")
points(two_day_hpc$datetime, sub3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
dev.off()