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
    multiple = TRUE)
)

plot_main <- mainPanel(
  plotlyOutput(outputId = "climatePlot")
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