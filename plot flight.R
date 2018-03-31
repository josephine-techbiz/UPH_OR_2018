# Plot a map with all flight
library(jsonlite)
airFlight <- fromJSON("http://public-api.adsbexchange.com/VirtualRadar/AircraftList.json")
aircraftList <- airFlight$acList

library(rworldmap)
createMap <- getMap(resolution = "high")

# flights in Asia Pacific
plot(createMap,  main = "Flight Map in Asia Pacific", xlim = c(100, 150), ylim = c(0,1), asp = 1)
points(aircraftList$Long, aircraftList$Lat, col = "blue", cex = .6)