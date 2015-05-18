##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

# Aggregate total emissions by year
NEI <- NEI[NEI$fips=="24510",]
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

##Plot data
png(filename = "plot2.png",width=600,height=600)

barplot((aggTotals$Emissions),names.arg=aggTotals$year,xlab="Year",ylab="Total PM2.5 Emissions",main="Total PM2.5 Emissions From All Baltimore Sources", col = "blue")

##End
dev.off()

