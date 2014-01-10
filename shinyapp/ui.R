###############################################
#Following shiny tutorial at
#"http://rstudio.github.io/shiny/tutorial/#hello-shiny"
#this is the user interface file; it describes what the user
#sees
########################################
library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Miles Per Gallon"),
  
  sidebarPanel(
    #the selectInput function creates a drop down box with the
    #label: "Variable:
    selectInput("variable","Variable:",
          list("Cylinders" = "cyl", 
               "Transmission" = "am", 
                "Gears" = "gear")),
    
    #add a checkbox with default value FALSE
    checkboxInput("outliers", "Show outliers", FALSE)
    ),
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mpgPlot")
  )
))
#The three functions headerPanel, sidebarPanel, 
#and mainPanel define the various regions of the user-interface. 
#The application will be called "Miles Per Gallon" so we specify
#that as the title when we create the header panel. The other panels 
#are empty for now.