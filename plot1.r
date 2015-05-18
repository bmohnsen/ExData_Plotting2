##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

# Aggregate total emissions by year
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

##Plot data
png(filename = "plot1.png",width=600,height=600)

barplot((aggTotals$Emissions),names.arg=aggTotals$year,xlab="Year",ylab="Total PM2.5 Emissions",main="Total PM2.5 Emissions From All US Sources", col = "red")

##End
dev.off()

