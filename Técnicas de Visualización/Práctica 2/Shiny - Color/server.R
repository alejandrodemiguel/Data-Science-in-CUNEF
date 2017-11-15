library(shiny)
library(ggplot)

function (input, output) {
  
  output$grafica <- renderPlot({
    
    graficaBase <- ggplot(mpg, aes_string(x = input$variablex,  y = input$variabley)) + 
      geom_point()
    
    if ((input$facet == TRUE) && (input$color == TRUE)) 
      ggplot(mpg, aes_string(x = input$variablex,  y = input$variabley, color = "class")) + 
      geom_point() + 
      facet_wrap(~manufacturer, ncol = 4)
    
    else 
      
      if ((input$facet == TRUE) && (input$color == FALSE)) 
        graficabase + 
      facet_wrap(~manufacturer, ncol = 4)
    
    else
      
      if ((input$facet == FALSE) && (input$color == TRUE)) 
        ggplot(mpg, aes_string(x = input$variablex,  y = input$variabley, color = "class")) + 
      geom_point()
    
    else
      
      if ((input$facet == FALSE) && (input$color == FALSE)) 
        graficaBase
    
    
  })
}

