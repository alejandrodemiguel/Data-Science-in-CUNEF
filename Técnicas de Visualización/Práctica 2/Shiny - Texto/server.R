library(shiny)
library(ggplot)

function(input, output) {
  
  output$Grafica <- renderPlot({
    ggplot(mpg, aes_string(x = input$variablex, y = input$variabley)) + 
      geom_point() +
      
      if (input$facet == TRUE) 
        facet_wrap(~manufacturer, ncol = 4)
  })
  
  output$texto <- renderText({
    
    x = input$variablex
    y = input$variabley
    sprintf('Esta es la grafica de la variable %s y la variable %s', x, y)
    
  })
  
}