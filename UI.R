library(shiny)

# Define UI for dataset viewer application
shinyUI(
  navbarPage("Speed/Distance Prediction",
             
  tabPanel("Analysis",
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(      
      numericInput("speed", "What is speed (mph) at which you are travelling?",10)
    ),
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
        tabsetPanel(
          tabPanel("Result",verbatimTextOutput("prediction")),
          tabPanel("Plot",plotOutput("plot"))
        )
     )
   )
  ),
  tabPanel("Help/Documentation",
           h2("Help"),
           hr(),
           p("This is a very simple model to predict stopping distance (in feet) required to stop the car. Model is build by running linear regression on cars dataset."),
           p("To use this tool click on Analysis tab provided in menu at top, Please Enter speed (in mph) at which your car is travelling in the text box provided in the left pane. Result tab will predict distance required to stop your car (in feet)."),
           p("Plot tab shows the exploratory analysis of data, we plot sqrt of distance on Y axis and speed on X axis and fitted line in red passing through the points.")           
  )
))