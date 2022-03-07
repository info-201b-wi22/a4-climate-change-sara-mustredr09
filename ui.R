library(ggplot2)
library(plotly)
library(bslib)

library(bslib)
#install.packages("htmlwidgets", type = "binary")
#install.packages("DT", type = "binary")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(bootswatch = "solar"),
            p("Around 137 countries have pledged carbon neutrality, with 90% setting a target year for reaching carbon neutrality. While the majority set 2050 as their target year, a few have set goals from 2030 to 2045. Only two countries, Suriname and Bhutan, have achieved carbon neutrality and are actually cabron negative, which means that they remove more carbon than they emit. In this report, I am analyzing the carbon emissions per capita of the countries that have pledged carbon neutrality by 2045. ")
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
    label = "Emissions per source",
    choices = list("Coal CO2 per capita" = "coal_co2_per_capita",
                   "Oil CO2 per capita" = "oil_co2_per_capita",
                   "Gas CO2 per capita" = "gas_co2_per_capita",
                   "Flaring CO2 per capita" = "flaring_co2_per_capita"),
    selected = "coal_co2_per_capita"
  )
  
)

plot_main <- mainPanel(
  plotlyOutput(outputId = "climate_change_plot"),
  p("This graph analyzes the carbon emissions per capita of the countries that have pledged carbon neutrality by 2045. These trends indicate how individuals’ behavior, or even circumstances can affect their contributions to carbon emissions. 
"),
  p("According to the repository of this project, the “complete CO2 and Greenhouse Gas Emissions dataset is a collection of key metrics maintained by Our World in Data. It is updated regularly and includes data on CO2 emissions (annual, per capita, cumulative and consumption-based), other greenhouse gases, energy mix, and other relevant metrics.” It uses several sources depending on the variable, such as the Global Carbon Project, the Climate Watch Portal, and  BP Statistical Review of World Energy."),
  p("While this dataset is very clear and comprehensive, it would be helpful to specify large corporations’ contributions to carbon emissions. Large corporations often contribute the most to carbon emissions and can stunt carbon neutrality regardless of individual civilians’ efforts. 
"),
  p("This dataset also fails to take into account how for example, the U.S. military is responsible for most of the U.S.’, and the world even, carbon emissions. Even if individual civilians might not be as environmentally conscious, this puts the responsibility on individuals rather than profit-hungry institutions and corporations.
"),
  p("Another limitation that I found was the fact that “Africa” was labeled as a country. While there is data about African countries in the dataset, this labeling has very problematic implications.
")
)

plot_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot_sidebar,
    plot_main
  )
)

vision_tab <- tabPanel(
  "Visions",
  p(strong("Those who directly interact with the system are known as direct stakeholder. Different stakeholders may have a unique perspective skills and concerns and what key roles were individuals interact directly with the system?")),
  
  p(strong("Prompt: Create a list of the system’s direct stakeholders. For each stakeholder role note at least one concern specific to the  role you may refer back to these roles throughout the project.")),
  
   p("I want to focus specifically on how highlighting per capita emissions might shift the blame of greenhouse gas emissions and global warming onto individuals. The lack of government regulations on large corporations’ CO2 emissions are the main parties responsible for global warming, and usually, marginalized communities who have little to null influence in these decisions are the most affected.
An example of this can be seen with salmon fishing in Washington state. Salmon is a very important source of sustenance and of deep symbolic significance for Indigenous communities in Washington. However, between excessive fishing by corporations and rising water temperatures due to global warming (which is also caused by industrial production), restrictions on salmon fishing have been placed on Indigenous communities, rather than corporations. Indigenous communities have and continue to live in a way that is very sustainable, but they as individuals carry with the most consequences.")
  )

ui <- navbarPage(
  "CO2 Contributions to Climate Change",
  intro_tab,
  plot_tab,
  vision_tab
)