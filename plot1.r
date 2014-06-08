setwd("~/Projects/ExData_Plotting1")

## Assuming the data in the zip file has been unzipped to a file `household_power_consumption.txt`
hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=";")

## Grab the subset of the data for the dates: 2007-02-01 and 2007-02-02
## In the raw data, Date is in format dd/mm/yyyy.
two_day_hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]


gap <- as.numeric(as.character(two_day_hpc$Global_active_power)) 

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(gap, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()