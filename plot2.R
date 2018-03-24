library(data.table)

setwd('/Users/heyan/Documents/Data Science/Exploratory Data Analysis/course project')

household_power_consumption <- fread('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,
                                            format = '%d/%m/%Y')
sub_house_consum_data <- subset(household_power_consumption,
                                Date >= '2007-02-01' & Date <= '2007-02-02')

sub_house_consum_data$Global_active_power <- as.numeric(sub_house_consum_data$Global_active_power)
sub_date <- as.POSIXct(paste(sub_house_consum_data$Date, sub_house_consum_data$Time,' '))

png('plot2.png')

plot(x = sub_date,
     y = sub_house_consum_data$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global_active_power (kilowatts)')

dev.off()
