########################################################
#Following shiny tutorial at
#"http://rstudio.github.io/shiny/tutorial/#hello-shiny"
#this is the server file; it describes what the the server
#does with the data and the user inputs

#To run this app you need to have both a ui.R and a server.R file in 
#a single directory then run: runApp("./shinyapp") where shinyapp is
#the name of the directory


########################################################
library(shiny)
library(datasets)

# Define server logic required to plot various variables against mpg

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

#Define server logic required to plot various variables against mpg
#Everything needs to be in the shinyServer function
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
})