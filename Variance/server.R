#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$oid1 <- renderPrint({
    cat("The text you enter is obtained as a string:\n")
    cat(input$vec1)
  }
  )
  
  output$oid2<-renderPrint({
    x <- as.numeric(unlist(strsplit(input$vec1,",")))
    cat("The obtained chain is converted to a vector:\n")
    print(x)
  }
  )
  
  output$oid3<-renderPrint({
    c <- as.numeric(unlist(strsplit(input$vec1,",")))
    n <- length(c)
    
    #Step 1----------------------------------
    total <- 0
    for(i in 1:n){
      total <- c[i] + total
    }
    cat("Step 1: Calculate the sum of all the data:\n")
    cat("The total sum is: ", total,"\n\n")
    
    #Step 2----------------------------------
    meanData <- total/n
    cat("Step 2: Calculate the mean:\n")
    cat("The mean of the vector is: ", meanData,"\n\n")
    
    #Step 3----------------------------------
    newData <- c
    for(i in 1:n){
      newData[i] <- c[i] - meanData
    }
    cat("Step 3: Subtract the mean to each data:\n")
    cat("After subtracting the mean at each value 
        from vector 1 we obtain vector 2: ", newData,"\n\n")
    
    #Step 4----------------------------------
    raiseData <- c
    for(i in 1:n){
      raiseData[i] <- newData[i] * newData[i]
    }
    cat("Step 4: Raise each result:\n")
    cat("By squaring each term of vector 2 is obtained: ", raiseData,"\n\n")
    
    #Step 5----------------------------------
    variance <- 0
    for(i in 1:n){
      variance <- raiseData[i] + variance
    }
    variance <- variance/n
    cat("Step 5: Sum all the data and calculate the mean of the sum:\n")
    cat("After all the steps we obtain our variance: ", variance,"\n\n")
    
  })
  
  output$plot1 <- renderPlot({
    userVector <- as.numeric(unlist(strsplit(input$vec1,",")))
    orderedVector <- sort(userVector, decreasing = TRUE)
    nvector <- length(userVector)
    
    if(input$showplot){
      plot(1:nvector, orderedVector,
           main = "Ploting vector",
           ylab = "User Data",
           type = "l",
           col = "red",fillCol = "red" )
    }
    
  })
  
})
