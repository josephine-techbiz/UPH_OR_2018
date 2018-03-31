# Plot data in a live stream mode
library("shiny")

myUI <- fluidPage(
  titlePanel("The Health Data"),
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      verbatimTextOutput("textOut"),
      tableOutput("theTable")
    )
  )
)

server <- function(input, output, session) {
  library(jsonlite)
  
  
  output$theTable <- renderTable({ 
    invalidateLater(3000, session)
    data <- fromJSON("http://ihealth.sepdek.net/")
    head(data$healthData, n = 14)
  },spacing = "xs")
  
}

shinyApp(myUI, server)