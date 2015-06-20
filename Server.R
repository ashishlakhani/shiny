library(shiny)
library(datasets)
data(cars)
# Define server logic required to summarize and view the selected
# dataset

shinyServer(function(input, output) {

  fit<-lm(sqrt(dist) ~ speed,data=cars)
  # Return the requested dataset
  output$plot <- renderPlot({plot(cars$speed,sqrt(cars$dist),xlab="Speed",ylab="sqrt(Distance)")
                             abline(fit,col="red")})
  output$prediction <- renderText({paste("You entered : ",input$speed,"\nDistance required for you to stop :",round(input$speed*fit$coef[2]+fit$coef[1],1)^2," feet")})
  
})