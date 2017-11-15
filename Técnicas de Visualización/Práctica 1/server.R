# Servidor

library(shiny)

shinyServer(function(input, output){
  
  output$plot <- renderPlot(hist(faithful$waiting,
                                 breaks = seq(min(faithful$waiting), 
                                              max(faithful$waiting), 
                                              length.out = input$bins + 1),
                                 col = "#75AADB", 
                                 border = "white",
                                 xlab = "Waiting time to next eruption (in mins)",
                                 main = "Histogram of waiting times")
  )
  
})