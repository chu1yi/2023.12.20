library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Summarize your data"), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    sliderInput("n", h4("Select the observed rows:"), min=5, max=20, value=10)
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),  
    tableOutput("view")  
  )  
  
))

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Summarize your data"), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    sliderInput("n", h4("Select the observed rows:"), min=5, max=20, value=10),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),
    plotOutput("scatterPlot"),
    tableOutput("view")  
  )  
  
))

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Ploting your data"), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  mainPanel(
    plotOutput("scatterPlot"),
    downloadButton("download", label = "Download plot", class = NULL)
  )  
  
))


library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Linear regression for two continuous variables."), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    uiOutput("choose_columns1"),   #這裡是關鍵
    uiOutput("choose_columns2")    #這裡是關鍵
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),
    plotOutput("plot",width = "500px", height = "500px")
  )  
  
))