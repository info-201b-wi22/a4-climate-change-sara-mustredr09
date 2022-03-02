library(ggplot2)
library(plotly)
library(dplyr)

#First things first make a new doc without the run app function.

climate_change_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

server <- function(input, output) {
  
  output$climatePlot <- renderPlotly({
    
#Choose carbon neutral countries.
    
cop2050_countries <- c("Suriname","Bhutan", "Austria","Iceland","Germany")

top_climate <-climate_change_data %>% 
  filter(country%in%cop2050_countries)
    
top_climate <- top_climate %>% filter(country %in% input$user_category)
    
    # Make a scatter plot
    climate_change_plot <- ggplot(data = top_climate) +
      geom_line(mapping = aes(x = year, 
                              y = oil_co2_per_capita, 
                              color= country))
    
    # Make interactive plot
    my_plotly_plot <- ggplotly(climate_change_plot) 
    
    return(my_plotly_plot)
  })
}


  