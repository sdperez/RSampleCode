library(circlize)
 op <- par(no.readonly = TRUE)
 set.seed(12345)
 rand_color = function() {
 return(rgb(runif(1), runif(1), runif(1)))
 }
 circos.clear()
 layout(matrix(1:9, 3, 3))
 for(i in 1:9) {
  factors = 1:8
  par(mar = c(0.5, 0.5, 0.5, 0.5))
  circos.par(cell.padding = c(0, 0, 0, 0))
  circos.initialize(factors, xlim = c(0, 1))
  circos.trackPlotRegion(ylim = c(0, 1), track.height = 0.05,
                            bg.col = sapply(1:8, function(x) rand_color()), bg.border = NA)
   for(i in 1:20) {
    se = sample(1:8, 2)
    col = rand_color()
    col = paste(col, "40", sep = "")
    circos.link(se[1], runif(2), se[2], runif(2), col = col)
    }
  circos.clear()
  }
par(op)


factors = 1:8
circos.initialize(factors, xlim = c(0, 1))
circos.initialize(factors, xlim = c(0, 1),
                   sector.width =as.numeric(factors) )
circos.trackPlotRegion(ylim = c(0, 1), track.height = .1,
                       bg.col = sapply(1:8, function(x) rand_color()), bg.border = NA)
se = sample(1:8, 2)
col = rand_color()
col = paste(col, "40", sep = "")
circos.link(se[1], runif(2), se[2], runif(2), col = col)

circos.initialize(factors, xlim = c(0, 2))
circos.trackPlotRegion(ylim = c(0, 2), track.height = 0.05,
                       bg.col = sapply(1:8, function(x) rand_color()), bg.border = NA)

 set.seed(12345)
 n = 1000
 a = data.frame(factor = sample(letters[1:8], n, replace = TRUE),
                  x = rnorm(n), y = runif(n))
n=data.frame(factor=rep(1:3,each=100),x = rnorm(300), y = runif(300))
 par(mar = c(1, 1, 1, 1), lwd = 0.1, cex = 0.7)
 circos.par("default.track.height" = 0.1)
 circos.initialize(factors = a$factor, x = a$x)

circos.trackPlotRegion(factors = a$factor, y = a$y, bg.col=1:8)
par(op)
