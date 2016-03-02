library(shiny)
library(plotly)

shinyUI(
  fluidPage(
    ##creates Title
    titlePanel("Iris Max Data"),
    
    ##creates the widgets on the side
      sidebarPanel(
       
        radioButtons("dataset", "Choose a piece of data to look at: (Y Column)", 
                    choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")),
         selectInput("color", "Graph Colors",
                    choices = c("Red" = 'red', "Blue" = 'blue', "Green" = 'green'))
      ),
    
    ##plots the graph
      mainPanel(
        plotlyOutput('iris')
      )
    )
  )