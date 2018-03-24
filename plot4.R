library(data.table)

setwd('/Users/heyan/Documents/Data Science/Exploratory Data Analysis/course project')

household_power_consumption <- fread('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,
                                            format = '%d/%m/%Y')
sub_house_consum_data <- subset(household_power_consumption,
                                Date >= '2007-02-01' & Date <= '2007-02-02')

sub_house_consum_data$Global_active_power <- as.numeric(sub_house_consum_data$Global_active_power)
sub_date <- as.POSIXct(paste(sub_house_consum_data$Date, sub_house_consum_data$Time,' '))

png('plot4.png')

par(mfrow = c(2,2))

plot(x = sub_date,
     y = sub_house_consum_data$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global_active_power (kilowatts)')

plot(x = sub_date,
     y = sub_house_consum_data$Voltage,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Voltage')

plot(x = sub_date,
     y = sub_house_consum_data$Sub_metering_1,
     type = 'l',
     col = 'black',
     xlab = '',
     ylab = 'Energy sub metering')
lines(x = sub_date, 
      y = sub_house_consum_data$Sub_metering_2,
      type = 'l',
      col = 'red')
lines(x = sub_date, 
      y = sub_house_consum_data$Sub_metering_3,
      type = 'l',
      col = 'blue')
legend(x = 'topright', 
       lty = 1,
       col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       bty = 'n')

plot(x = sub_date,
     y = sub_house_consum_data$Global_reactive_power,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')

dev.off()