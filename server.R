library(ggplot2)
library(plotly)
library(dplyr)

#First things first make a new doc without the run app function.

climate_change_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

#Plot function. 

server <- function(input, output) {
  
  #Choose carbon neutral countries.
  
  output$climate_change_plot <- renderPlotly({
    
cop2050_countries <- c("Suriname","Bhutan","Austria","Iceland","Germany")
    
top_climate <-climate_change_data %>% 
  filter(country%in%cop2050_countries) %>%
  filter(country%in%input$user_category)
      
# You can access the values of the second widget with input$slider2, e.g.
#More slider stuff.

# Make a scatter plot
  climate_change_plot <- ggplot(data = top_climate) +
    geom_line(mapping = aes(x = year, 
                           y = get(input$user_category2), 
                           color= country))+
  labs(title = "CO2 Emissions", x = "Year", y = "Emissions per capita, per source")
  
    
    # Make interactive plot
    my_plotly_plot <- ggplotly(climate_change_plot) 
    
    return(my_plotly_plot)
  })
}


  