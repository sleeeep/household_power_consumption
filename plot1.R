library(data.table)

setwd('/Users/heyan/Documents/Data Science/Exploratory Data Analysis/course project')

household_power_consumption <- fread('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,
                                            format = '%d/%m/%Y')
sub_house_consum_data <- subset(household_power_consumption,
                                Date >= '2007-02-01' & Date <= '2007-02-02')

png('plot1.png')

hist(as.numeric(sub_house_consum_data$Global_active_power),
     col = 'red',
     main = 'Global_active_power',
     xlab = 'Global_active_power (kilowatts)')

dev.off()
