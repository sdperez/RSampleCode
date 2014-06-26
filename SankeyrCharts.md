Sankey Diagrams
========================================================

Taken from @timelyportfolio, this shows how to create Sankey diagrams using rCharts


```r
# results=asis is needed to properly display html/js in markdown
# (otherwise it just shows the code).
UKvisits <- data.frame(origin = c("France", "Germany", "USA", "Irish Republic", 
    "Netherlands", "Spain", "Italy", "Poland", "Belgium", "Australia", "Other countries", 
    rep("UK", 5)), visit = c(rep("UK", 11), "Scotland", "Wales", "Northern Ireland", 
    "England", "London"), weights = c(c(12, 10, 9, 8, 6, 6, 5, 4, 4, 3, 33)/100 * 
    31.8, c(2.2, 0.9, 0.4, 12.8, 15.5)))

# these are the default names you must use
colnames(UKvisits) <- c("source", "target", "value")


require(rCharts)
```

```
## Loading required package: rCharts
```

```r

sankeyPlot <- rCharts$new()
# you need the template file to create sankey diagrams.
sankeyPlot$setLib("http://timelyportfolio.github.io/rCharts_d3_sankey")


sankeyPlot$set(data = UKvisits, nodeWidth = 15, nodePadding = 10, layout = 32, 
    width = 750, height = 500, labelFormat = ".1%")

sankeyPlot
```

<iframe src='
figure/unnamed-chunk-1.html
' scrolling='no' seamless class='rChart 
http://timelyportfolio.github.io/rCharts_d3_sankey
 '
id=iframe-
chart1df01c7b3a87
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>

