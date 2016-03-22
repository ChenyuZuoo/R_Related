library(dplyr)
library("reshape2", lib.loc="~/R/win-library/3.2")
library("choroplethrMaps")
library("choroplethr")

#read Florida election result from website
Florida <- read.delim("http://fldoselectionfiles.elections.myflorida.com/enightfilespublic/20160315_ElecResultsFL.txt", strip.white = TRUE)
head(Florida)
str(Florida)
summary(Florida)

#subset dataset
dem <- subset(Florida, PartyCode == "DEM", select = c(CountyName, CanNameLast, CanVotes))
head(dem)

#cast dateset from long format into wide format
dem_cast <- dcast(dem, CountyName ~ CanNameLast, sum)
head(dem, 10)
str(dem_cast)
colnames(dem_cast)[3] <- "Omalley" #remove apostrophe

#create new columns, sum and percentage
dem_cast <- mutate(dem_cast, total = Clinton + Omalley + Sanders)
dem_cast <- mutate(dem_cast, hc = (Clinton/total)*100, ho = (Omalley/total)*100, hs = (Sanders/total)*100)
dem_cast[, 6:8] <- round(dem_cast[, 6:8], digits = 1)
head(dem_cast)

#county.name dataset contains FIPS codes and state names.
data("county.regions")
head(county.regions)
sub_regions <- subset(county.regions, state.name == "florida", select = c(region, CountyName))

#join FIPS codes into dem_cast dataFrame
#for merge data, mey key is CountyName, lower case the names in order to match
testName <- sapply(dem_cast$CountyName, tolower)
dem_cast_new <- data.frame(testName, dem_cast[, 2:8])
colnames(dem_cast_new)[1] <- "CountyName"
df <- left_join(dem_cast_new, sub_regions)

#map drawing, the function needs value and region to plot
df$value <- df$hc
county_choropleth(df, title = "Clinton", legend = "%", num_colors = 1, state_zoom = "florida")
df$value <- df$ho
county_choropleth(df, title = "Omalley", legend = "%", num_colors = 1, state_zoom = "florida")
df$value <- df$hs
county_choropleth(df, title = "Sanders", legend = "%", num_colors = 1, state_zoom = "florida")

