library(shiny)

shinyServer(function(input, output) {
  
  output$summary = renderPrint({
    if (is.null(input$files)==TRUE) {return("You have to up load your data!!!")} else {
      dat = read.table(input$files$datapath, header = TRUE)
      summary(dat)                     
    }        
  })
  
  output$view = renderTable({
    if (is.null(input$files)==TRUE) {return()} else {
      dat = read.table(input$files$datapath, header = TRUE)
      head(dat, input$n)                     
    }        
  })
  
})