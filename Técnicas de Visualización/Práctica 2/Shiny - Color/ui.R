library(shiny)

shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("variablex", label = 'Eje horizontal',
                    choices = list("Cylinders" = 'cyl',
                                   "miles per gallon" = 'hwy', 
                                   "displacement" = 'displ')), 
                     
        selectInput("variabley", label = 'Eje vertical',
                    choices = list("Cylinders" = 'cyl', 
                                   "miles per gallon" = 'hwy',  
                                   "displacement" = 'displ')),
                    
        
        checkboxInput("facet", label = "Division", value = FALSE),
        
        checkboxInput("color", label = "Colorear por tipo", value = FALSE)
        
        
      ),
      mainPanel(
        
        plotOutput("grafica")
      )
    )
  )
)
