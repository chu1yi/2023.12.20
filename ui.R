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