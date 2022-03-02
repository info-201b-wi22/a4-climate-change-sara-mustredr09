library(ggplot2)
library(plotly)
library(dplyr)

#First things first make a new doc without the run app function.

climate_change_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

server <- function(input, output) {
  
  output$climatePlot <- renderPlotly({
    
    climate_change_data <- climate_change_data %>%  filter(country %in% input$user_category)
    
    # Make a scatter plot
    climate_change_plot <- ggplot(data = climate_change_data) +
      geom_col(mapping = aes(x = year, 
                              y = oil_co2_per_capita, 
                              color= country))
    # Make interactive plot
    my_plotly_plot <- ggplotly(climate_change_plot) 
    
    return(my_plotly_plot)
  })
}


  