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

library(shiny)

shinyServer(function(input, output) {
  
  DATA = reactive({
    if (is.null(input$files)) {return()} else {
      dat = read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  output$summary = renderPrint({
    dat = DATA()
    if (is.null(dat)) {return("You have to up load your data!!!")} else {
      summary(dat)
    }
  })
  
  output$scatterPlot = renderPlot({
    dat = DATA()
    if (is.null(dat)) {return()} else {
      plot(dat,col=input$Color)
    }
  })
  
  output$view = renderTable({
    dat = DATA()
    if (is.null(dat)) {return()} else {
      head(dat,input$n) 
    }
  })
  
})