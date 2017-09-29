#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calculation of variance"),
  
  fluidRow(
    column(10,
           h3("What is the variance?"),
           p("Variance is a measure of dispersion, a measure of how 
             data values may differ from their mean. The variance is 
             the arithmetic mean of the squares of the differences of 
             the individual values of the means. The squared elevation 
             ensures that the positive and negative values do not 
             cancel each other out."),
           em("This calculator calculates the variance of a data set.\n"),
           p(""),
           p("For the determination of the variance it is necessary 
             to specify and the data belong to a sample of a population. 
             Enter the values of the observations in the text field, 
             delimited by commas."),
           p("")
    )
  ),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput('vec1', 'Enter a vector (comma delimited)', "2, 3, 6, 8, 11"),
      checkboxInput("showplot", "Show/Hide Plot", value = TRUE),
      p("In probability theory and statistics, variance is the expectation 
        of the squared deviation of a random variable from its mean. 
        Informally, it measures how far a set of (random) numbers are 
        spread out from their average value. Variance has a central role 
        in statistics, where some ideas that use it include descriptive 
        statistics, statistical inference, hypothesis testing, goodness 
        of fit, and Monte Carlo sampling. Variance is an important tool 
        in the sciences, where statistical analysis of data is common. 
        The variance is the square of the standard deviation, the second 
        central moment of a distribution, and the covariance of the 
        random variable with itself."),
      img(src='fortmule.png', align = "left"),
      em("https://en.wikipedia.org/wiki/Variance")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4('You entered'),
      verbatimTextOutput("oid1"),
      verbatimTextOutput("oid2"),
      verbatimTextOutput("oid3"),
      plotOutput("plot1")
    )
  )
))
