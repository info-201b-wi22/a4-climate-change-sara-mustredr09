library(ggplot2)
library(plotly)
library(bslib)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(bootswatch = "cerulean"),
            p("Look at how many data there is about climate change!?")
  )
)

plot_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Select country",
    choices = top_climate$country,
    selected = "Suriname",
    multiple = TRUE),
  
  selectInput(
    inputId = "user_category2",
    label = "Color By",
    choices = list("Coal CO2 per capita" = "coal_co2_per_capita",
                   "Oil CO2 per capita" = "oil_co2_per_capita",
                   "Gas CO2 per capita" = "gas_co2_per_capita",
                   "Flaring CO2 per capita" = "flaring_co2_per_capita"),
    selected = "coal_co2_per_capita"
  )
  
)
  
  # Copy the line below to make a slider bar 
#sliderInput("slider1", 
           # label = h3("Years"), 
          #  min = count_range[1], 
         #   max = count_range[2], 
         #   value = max(count_range),
          #  step=1)
#)

plot_main <- mainPanel(
  plotlyOutput(outputId = "climate_change_plot"),
)

plot_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot_sidebar,
    plot_main
  )
)

ui <- navbarPage(
  "Climate Change",
  intro_tab,
  plot_tab
)

#Year column might not be an integer. You are comparing a string with an integer, so that‘s no compatible.
#Find a range from a certain column.
#range(dataframe$column) value=max(count_range)
