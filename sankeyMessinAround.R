
#library(devtools)
#install_github('rCharts', 'ramnathv')
require(rCharts)
sankeyPlot2 <- rCharts$new()
sankeyPlot2$setLib('C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/R/RSampleCode/libraries/widgets/d3_sankey')
sankeyPlot2$setTemplate(script = 'C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/R/RSampleCode/libraries/widgets/d3_sankey/layouts/chart.html')


sankeyPlot2$set(
    data = UKvisits,
    nodeWidth = 15,
    nodePadding = 10,
    layout = 32,
    width = 960,
    height = 500
  )
sankeyPlot2$print("name",include_assets=TRUE)

UKvisits <- data.frame(origin=c(
  "France", "Germany", "USA",
  "Irish Republic", "Netherlands",
  "Spain", "Italy", "Poland",
  "Belgium", "Australia", 
  "Other countries", rep("UK", 5)),
  visit=c(
    rep("UK", 11), "Scotland",
    "Wales", "Northern Ireland", 
    "England", "London"),
  weights=c(
    c(12,10,9,8,6,6,5,4,4,3,33)/100*31.8, 
    c(2.2,0.9,0.4,12.8,15.5)))
## Uncomment the next 3 lines to install the developer version of googleVis
# install.packages(c("devtools","RJSONIO", "knitr", "shiny", "httpuv"))
 library(devtools)
 install_github("mages/googleVis")
require(googleVis)
plot(
  gvisSankey(UKvisits, from="origin", 
             to="visit", weight="weight",
             options=list(
               height=250,
               sankey="{link:{color:{fill:'lightblue'}}}"
             ))
)

dat <- data.frame(t = rep(0:23, each = 4), var = rep(LETTERS[1:4], 4), val = round(runif(4 * 
                                                                                           24, 0, 50)))
p8 <- nPlot(val ~ t, group = "var", data = dat, type = "stackedAreaChart", id = "chart")
p8$print("name", include_assets = TRUE)
p8

