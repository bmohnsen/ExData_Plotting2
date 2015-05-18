##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

##Subset
NEI <- NEI[NEI$SCC==10100101,]

## Aggregate total emissions by year
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

##Plot data
png(filename = "plot4.png",width=800,height=800)

barplot((aggTotals$Emissions),names.arg=aggTotals$year,xlab="Year",ylab="Total PM2.5 - Coal Emissions",main="Total PM2.5 Coal Emissions From All US Sources", col = "blue")

##End
dev.off()