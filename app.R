library(shiny)
library(bslib)

# install.packages(rsconnect)
library(rsconnect)
source("ui.R")
source("server.R")

# Add a dynamic title to the hot dog plot
# Publish your Shiny App to the web

shinyApp(ui = ui, server = server)
