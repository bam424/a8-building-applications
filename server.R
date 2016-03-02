library(shiny)
library(plotly)
library(dplyr)

shinyServer(function(input, output) {
  
  output$iris <- renderPlotly({
    # Summarises the data by showing all the max values of each column, except Species
    df <- iris %>% group_by(Species) %>% 
              summarise(Sepal.Length = max(Sepal.Length),
                        Sepal.Width = max(Sepal.Width),
                        Petal.Length = max(Petal.Length),
                        Petal.Width = max(Petal.Width))
    var1 <- input$color
    var2 <- input$dataset
    
    #Creates the plot from the newly formatted data frame
    plot_ly(df,
            x = Species,
            y = eval(parse(text = var2)),
            type = 'bar', marker = list(color = toRGB(var1))) %>%  layout (yaxis = list(title = var2))
  })
})