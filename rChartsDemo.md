Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
library(rCharts)
options(rcharts.mode = "iframesrc", rcharts.cdn = TRUE, RCHART_WIDTH = 600, 
    RCHART_HEIGHT = 400)
opts_chunk$set(tidy = F, results = "asis", comment = NA)

dat <- data.frame(t = rep(0:23, each = 4), var = rep(LETTERS[1:4], 4), val = round(runif(4 * 
    24, 0, 50)))
p8 <- nPlot(val ~ t, group = "var", data = dat, type = "stackedAreaChart", id = "chart")
p8$print("name", include_assets = TRUE)
```

<link rel='stylesheet' href=http://nvd3.org/assets/css/nv.d3.css>
<script type='text/javascript' src=http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js></script>
<script type='text/javascript' src=http://d3js.org/d3.v3.min.js></script>
<script type='text/javascript' src=http://timelyportfolio.github.io/rCharts_nvd3_tests/libraries/widgets/nvd3/js/nv.d3.min-new.js></script>
<script type='text/javascript' src=http://nvd3.org/assets/lib/fisheye.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 600px;
    height: 400px;
  }  
  </style>
<div id = 'name' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawname()
    });
    function drawname(){  
      var opts = {
 "dom": "name",
"width":    600,
"height":    400,
"x": "t",
"y": "val",
"group": "var",
"type": "stackedAreaChart",
"id": "name" 
},
        data = [
 {
 "t": 0,
"var": "A",
"val":             21 
},
{
 "t": 0,
"var": "B",
"val":             45 
},
{
 "t": 0,
"var": "C",
"val":             33 
},
{
 "t": 0,
"var": "D",
"val":              5 
},
{
 "t": 1,
"var": "A",
"val":             14 
},
{
 "t": 1,
"var": "B",
"val":             10 
},
{
 "t": 1,
"var": "C",
"val":              6 
},
{
 "t": 1,
"var": "D",
"val":             29 
},
{
 "t": 2,
"var": "A",
"val":             41 
},
{
 "t": 2,
"var": "B",
"val":             20 
},
{
 "t": 2,
"var": "C",
"val":             16 
},
{
 "t": 2,
"var": "D",
"val":             31 
},
{
 "t": 3,
"var": "A",
"val":             46 
},
{
 "t": 3,
"var": "B",
"val":             45 
},
{
 "t": 3,
"var": "C",
"val":              8 
},
{
 "t": 3,
"var": "D",
"val":              6 
},
{
 "t": 4,
"var": "A",
"val":              5 
},
{
 "t": 4,
"var": "B",
"val":             38 
},
{
 "t": 4,
"var": "C",
"val":             45 
},
{
 "t": 4,
"var": "D",
"val":             33 
},
{
 "t": 5,
"var": "A",
"val":             34 
},
{
 "t": 5,
"var": "B",
"val":             41 
},
{
 "t": 5,
"var": "C",
"val":             11 
},
{
 "t": 5,
"var": "D",
"val":             21 
},
{
 "t": 6,
"var": "A",
"val":             44 
},
{
 "t": 6,
"var": "B",
"val":             44 
},
{
 "t": 6,
"var": "C",
"val":             12 
},
{
 "t": 6,
"var": "D",
"val":             16 
},
{
 "t": 7,
"var": "A",
"val":             44 
},
{
 "t": 7,
"var": "B",
"val":             44 
},
{
 "t": 7,
"var": "C",
"val":             17 
},
{
 "t": 7,
"var": "D",
"val":             37 
},
{
 "t": 8,
"var": "A",
"val":              3 
},
{
 "t": 8,
"var": "B",
"val":             16 
},
{
 "t": 8,
"var": "C",
"val":             32 
},
{
 "t": 8,
"var": "D",
"val":              2 
},
{
 "t": 9,
"var": "A",
"val":              1 
},
{
 "t": 9,
"var": "B",
"val":             21 
},
{
 "t": 9,
"var": "C",
"val":             49 
},
{
 "t": 9,
"var": "D",
"val":             31 
},
{
 "t": 10,
"var": "A",
"val":              5 
},
{
 "t": 10,
"var": "B",
"val":             18 
},
{
 "t": 10,
"var": "C",
"val":             13 
},
{
 "t": 10,
"var": "D",
"val":             16 
},
{
 "t": 11,
"var": "A",
"val":              8 
},
{
 "t": 11,
"var": "B",
"val":             38 
},
{
 "t": 11,
"var": "C",
"val":             18 
},
{
 "t": 11,
"var": "D",
"val":             11 
},
{
 "t": 12,
"var": "A",
"val":              8 
},
{
 "t": 12,
"var": "B",
"val":             25 
},
{
 "t": 12,
"var": "C",
"val":             32 
},
{
 "t": 12,
"var": "D",
"val":             14 
},
{
 "t": 13,
"var": "A",
"val":             10 
},
{
 "t": 13,
"var": "B",
"val":             16 
},
{
 "t": 13,
"var": "C",
"val":             43 
},
{
 "t": 13,
"var": "D",
"val":             26 
},
{
 "t": 14,
"var": "A",
"val":             34 
},
{
 "t": 14,
"var": "B",
"val":             27 
},
{
 "t": 14,
"var": "C",
"val":             31 
},
{
 "t": 14,
"var": "D",
"val":             36 
},
{
 "t": 15,
"var": "A",
"val":              3 
},
{
 "t": 15,
"var": "B",
"val":             45 
},
{
 "t": 15,
"var": "C",
"val":             31 
},
{
 "t": 15,
"var": "D",
"val":              8 
},
{
 "t": 16,
"var": "A",
"val":              1 
},
{
 "t": 16,
"var": "B",
"val":             25 
},
{
 "t": 16,
"var": "C",
"val":              6 
},
{
 "t": 16,
"var": "D",
"val":             27 
},
{
 "t": 17,
"var": "A",
"val":              9 
},
{
 "t": 17,
"var": "B",
"val":             40 
},
{
 "t": 17,
"var": "C",
"val":             47 
},
{
 "t": 17,
"var": "D",
"val":             29 
},
{
 "t": 18,
"var": "A",
"val":             37 
},
{
 "t": 18,
"var": "B",
"val":             19 
},
{
 "t": 18,
"var": "C",
"val":             39 
},
{
 "t": 18,
"var": "D",
"val":              6 
},
{
 "t": 19,
"var": "A",
"val":              0 
},
{
 "t": 19,
"var": "B",
"val":             31 
},
{
 "t": 19,
"var": "C",
"val":             22 
},
{
 "t": 19,
"var": "D",
"val":             31 
},
{
 "t": 20,
"var": "A",
"val":             28 
},
{
 "t": 20,
"var": "B",
"val":             34 
},
{
 "t": 20,
"var": "C",
"val":             11 
},
{
 "t": 20,
"var": "D",
"val":             25 
},
{
 "t": 21,
"var": "A",
"val":             18 
},
{
 "t": 21,
"var": "B",
"val":             33 
},
{
 "t": 21,
"var": "C",
"val":             11 
},
{
 "t": 21,
"var": "D",
"val":             35 
},
{
 "t": 22,
"var": "A",
"val":             22 
},
{
 "t": 22,
"var": "B",
"val":             19 
},
{
 "t": 22,
"var": "C",
"val":             35 
},
{
 "t": 22,
"var": "D",
"val":             20 
},
{
 "t": 23,
"var": "A",
"val":             49 
},
{
 "t": 23,
"var": "B",
"val":             48 
},
{
 "t": 23,
"var": "C",
"val":             12 
},
{
 "t": 23,
"var": "D",
"val":             43 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .x(function(d) { return d[opts.x] })
          .y(function(d) { return d[opts.y] })
          .width(opts.width)
          .height(opts.height)
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

```r
p8
```

<iframe srcdoc='
&lt;!doctype HTML&gt;
&lt;meta charset = &#039;utf-8&#039;&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;link rel=&#039;stylesheet&#039; href=&#039;http://nvd3.org/assets/css/nv.d3.css&#039;&gt;
    
    &lt;script src=&#039;http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://d3js.org/d3.v3.min.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://timelyportfolio.github.io/rCharts_nvd3_tests/libraries/widgets/nvd3/js/nv.d3.min-new.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://nvd3.org/assets/lib/fisheye.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    
    &lt;style&gt;
    .rChart {
      display: block;
      margin-left: auto; 
      margin-right: auto;
      width: 600px;
      height: 400px;
    }  
    &lt;/style&gt;
    
  &lt;/head&gt;
  &lt;body&gt;
    &lt;div id=&#039;name&#039; class=&#039;rChart nvd3&#039;&gt;&lt;/div&gt;  
    
    &lt;script type=&#039;text/javascript&#039;&gt;
 $(document).ready(function(){
      drawname()
    });
    function drawname(){  
      var opts = {
 &quot;dom&quot;: &quot;name&quot;,
&quot;width&quot;:    600,
&quot;height&quot;:    400,
&quot;x&quot;: &quot;t&quot;,
&quot;y&quot;: &quot;val&quot;,
&quot;group&quot;: &quot;var&quot;,
&quot;type&quot;: &quot;stackedAreaChart&quot;,
&quot;id&quot;: &quot;name&quot; 
},
        data = [
 {
 &quot;t&quot;: 0,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             21 
},
{
 &quot;t&quot;: 0,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             45 
},
{
 &quot;t&quot;: 0,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             33 
},
{
 &quot;t&quot;: 0,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:              5 
},
{
 &quot;t&quot;: 1,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             14 
},
{
 &quot;t&quot;: 1,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             10 
},
{
 &quot;t&quot;: 1,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:              6 
},
{
 &quot;t&quot;: 1,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             29 
},
{
 &quot;t&quot;: 2,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             41 
},
{
 &quot;t&quot;: 2,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             20 
},
{
 &quot;t&quot;: 2,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             16 
},
{
 &quot;t&quot;: 2,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 3,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             46 
},
{
 &quot;t&quot;: 3,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             45 
},
{
 &quot;t&quot;: 3,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:              8 
},
{
 &quot;t&quot;: 3,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:              6 
},
{
 &quot;t&quot;: 4,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              5 
},
{
 &quot;t&quot;: 4,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             38 
},
{
 &quot;t&quot;: 4,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             45 
},
{
 &quot;t&quot;: 4,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             33 
},
{
 &quot;t&quot;: 5,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             34 
},
{
 &quot;t&quot;: 5,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             41 
},
{
 &quot;t&quot;: 5,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             11 
},
{
 &quot;t&quot;: 5,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             21 
},
{
 &quot;t&quot;: 6,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             44 
},
{
 &quot;t&quot;: 6,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             44 
},
{
 &quot;t&quot;: 6,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             12 
},
{
 &quot;t&quot;: 6,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             16 
},
{
 &quot;t&quot;: 7,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             44 
},
{
 &quot;t&quot;: 7,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             44 
},
{
 &quot;t&quot;: 7,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             17 
},
{
 &quot;t&quot;: 7,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             37 
},
{
 &quot;t&quot;: 8,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              3 
},
{
 &quot;t&quot;: 8,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             16 
},
{
 &quot;t&quot;: 8,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             32 
},
{
 &quot;t&quot;: 8,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:              2 
},
{
 &quot;t&quot;: 9,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              1 
},
{
 &quot;t&quot;: 9,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             21 
},
{
 &quot;t&quot;: 9,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             49 
},
{
 &quot;t&quot;: 9,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 10,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              5 
},
{
 &quot;t&quot;: 10,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             18 
},
{
 &quot;t&quot;: 10,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             13 
},
{
 &quot;t&quot;: 10,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             16 
},
{
 &quot;t&quot;: 11,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              8 
},
{
 &quot;t&quot;: 11,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             38 
},
{
 &quot;t&quot;: 11,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             18 
},
{
 &quot;t&quot;: 11,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             11 
},
{
 &quot;t&quot;: 12,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              8 
},
{
 &quot;t&quot;: 12,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             25 
},
{
 &quot;t&quot;: 12,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             32 
},
{
 &quot;t&quot;: 12,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             14 
},
{
 &quot;t&quot;: 13,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             10 
},
{
 &quot;t&quot;: 13,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             16 
},
{
 &quot;t&quot;: 13,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             43 
},
{
 &quot;t&quot;: 13,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             26 
},
{
 &quot;t&quot;: 14,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             34 
},
{
 &quot;t&quot;: 14,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             27 
},
{
 &quot;t&quot;: 14,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 14,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             36 
},
{
 &quot;t&quot;: 15,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              3 
},
{
 &quot;t&quot;: 15,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             45 
},
{
 &quot;t&quot;: 15,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 15,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:              8 
},
{
 &quot;t&quot;: 16,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              1 
},
{
 &quot;t&quot;: 16,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             25 
},
{
 &quot;t&quot;: 16,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:              6 
},
{
 &quot;t&quot;: 16,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             27 
},
{
 &quot;t&quot;: 17,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              9 
},
{
 &quot;t&quot;: 17,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             40 
},
{
 &quot;t&quot;: 17,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             47 
},
{
 &quot;t&quot;: 17,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             29 
},
{
 &quot;t&quot;: 18,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             37 
},
{
 &quot;t&quot;: 18,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             19 
},
{
 &quot;t&quot;: 18,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             39 
},
{
 &quot;t&quot;: 18,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:              6 
},
{
 &quot;t&quot;: 19,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:              0 
},
{
 &quot;t&quot;: 19,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 19,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             22 
},
{
 &quot;t&quot;: 19,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             31 
},
{
 &quot;t&quot;: 20,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             28 
},
{
 &quot;t&quot;: 20,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             34 
},
{
 &quot;t&quot;: 20,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             11 
},
{
 &quot;t&quot;: 20,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             25 
},
{
 &quot;t&quot;: 21,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             18 
},
{
 &quot;t&quot;: 21,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             33 
},
{
 &quot;t&quot;: 21,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             11 
},
{
 &quot;t&quot;: 21,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             35 
},
{
 &quot;t&quot;: 22,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             22 
},
{
 &quot;t&quot;: 22,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             19 
},
{
 &quot;t&quot;: 22,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             35 
},
{
 &quot;t&quot;: 22,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             20 
},
{
 &quot;t&quot;: 23,
&quot;var&quot;: &quot;A&quot;,
&quot;val&quot;:             49 
},
{
 &quot;t&quot;: 23,
&quot;var&quot;: &quot;B&quot;,
&quot;val&quot;:             48 
},
{
 &quot;t&quot;: 23,
&quot;var&quot;: &quot;C&quot;,
&quot;val&quot;:             12 
},
{
 &quot;t&quot;: 23,
&quot;var&quot;: &quot;D&quot;,
&quot;val&quot;:             43 
} 
]
  
      if(!(opts.type===&quot;pieChart&quot; || opts.type===&quot;sparklinePlus&quot;)) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? &#039;main&#039; : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .x(function(d) { return d[opts.x] })
          .y(function(d) { return d[opts.y] })
          .width(opts.width)
          .height(opts.height)
         
        
          
        

        
        
        
      
       d3.select(&quot;#&quot; + opts.id)
        .append(&#039;svg&#039;)
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
&lt;/script&gt;
    
  &lt;/body&gt;
&lt;/html&gt;
' scrolling='no' seamless class='rChart 
nvd3
 '
id=iframe-
name
></iframe>
<style>iframe.rChart{ width: 100%; height: 400px;}</style>


