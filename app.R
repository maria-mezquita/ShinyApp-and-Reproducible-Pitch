#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

ui <- fluidPage(

# Application title
titlePanel("Old Faithful Geyser Data"),
date(),


h2("Overview"),
"This peer assessed assignment has two parts:",
"First, you will create a Shiny application and deploy it on Rstudio's servers.",
"Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.",

h2("How to use the application"),
"This application is using data related to geysers comparing the frequency and the waiting time (in mins) in between eruptions. Please use the slider to select the number of bins that you would like to see in the plot below.",
"The ui.R and Server.R code created will be placed into my ", a("GitHub Repository.",href="https://github.com/maria-mezquita/ShinyApp-and-Reproducible-Pitch.git"),


# Define UI for application that draws a histogram

h4("Choose number of bins to display"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins to display:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
