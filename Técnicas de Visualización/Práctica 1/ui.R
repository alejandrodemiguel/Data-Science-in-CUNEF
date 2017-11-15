# Interfaz de Usuario

# install.packages('shiny')

library(shiny)

shinyUI(
  
  fluidPage(
    titlePanel('Old Faithful Geysser'),
    sidebarLayout(
      sidebarPanel(
        sliderInput('bins', 'Number of bins', min = 1, max = 20, value = 10 )
      ),
      mainPanel(
        plotOutput('plot')
      )
    )
  )
  
)
