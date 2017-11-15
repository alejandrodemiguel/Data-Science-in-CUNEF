library(shiny)

shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput('variablex', 
                    label = 'Eje horizontal', 
                    choices =  c("Cylinders" = "cyl",
                                 "Milespergalon" = "hwy",
                                 "Displacement" = "displ")),
        
        selectInput('variabley',
                    label = 'Eje vertical',
                    choices = c("Cylinders" = "cyl",
                                "Milespergalon" = "hwy",
                                "Displacement" = "displ")),
        checkboxInput("facet", label = "División", value = FALSE)
      ),

                    
      mainPanel(
        textOutput('texto'),
        plotOutput('Grafica')
      )
    )
  )
)
