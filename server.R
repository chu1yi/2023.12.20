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

library(shiny)

shinyServer(function(input, output) {
  
  DATA = reactive({
    if (is.null(input$files)) {return()} else {
      dat = read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  output$scatterPlot = renderPlot({
    dat = DATA()
    if (is.null(dat)) {return()} else {
      plot(dat,col=input$Color)
    }
  })
  
  output$download = downloadHandler(
    filename = function() {'plot.pdf'},
    content = function(con) {
      dat = DATA()
      if (is.null(dat)) {return()} else {
        pdf(con)
        plot(dat,col=input$Color)
        dev.off()
      }
    }
  )
  
})

library(shiny)

shinyServer(function(input, output) {
  
  DATA <- reactive({
    if (is.null(input$files)) {return()} else {
      dat <- read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  output$choose_columns1 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)) {return()} else {
      colnames <- colnames(dat)
      selectInput("Y", h4("Choose a dependence variable:"), choices = colnames)
    }
  })
  
  output$choose_columns2 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)) {return()} else {
      colnames <- colnames(dat)
      selectInput("X", h4("Choose a independence variable:"), choices = colnames[which(colnames!=input$Y)])
    }
  })
  
  output$summary <- renderPrint({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      Result=lm(Y~X)
      return(summary(Result))
    }  
  })
  
  output$plot <- renderPlot({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      plot(X,Y,pch=19)
      abline(lm(Y~X),col="black")   
    }  
  })
  
})






library(shiny)

shinyServer(function(input, output) {
  
  DATA <- reactive({
    if (is.null(input$files)) {return()} else {
      dat <- read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  output$choose_columns1 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)) {return()} else {
      colnames <- colnames(dat)
      selectInput("Y", h4("Choose a dependence variable:"), choices = colnames)
    }
  })
  
  output$choose_columns2 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)) {return()} else {
      colnames <- colnames(dat)
      selectInput("X", h4("Choose a independence variable:"), choices = colnames[which(colnames!=input$Y)])
    }
  })
  
  output$summary <- renderPrint({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      Result=cor.test(X,Y,method=input$method)
      return(Result)
    }  
  })
  
  output$plot <- renderPlot({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      plot(X,Y,pch=19,col=input$Color)
      abline(lm(Y~X),col="black")   
    }  
  })
  
})