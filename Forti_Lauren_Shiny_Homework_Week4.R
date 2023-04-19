# load packages
library(shiny)
library(tidyverse)

# read in dataset
df <- read.csv("global-superstore.csv")

# define ui
ui <- fluidPage(
  titlePanel(strong("DSCI 324: Data Visualization")),

  ## QUESTION 2 ##
  # titles
  sidebarLayout(
    h3("Question 2"),
    br(),
    
    sidebarPanel(
      h2("Global Super Store"),
      
      # cost slider
      sliderInput("costs",
                  strong("Shipping Cost"),
                  min = 0,
                  max = 950,
                  value = c(100, 900)
      ),
      
      # category buttons
      radioButtons("category",
                   "Category",
                   c("Technology" = "tech",
                   "Furniture" = "furniture",
                   "Office Supplies" = "office")
                   ),
      
      # country dropdown
      selectInput("country", 
                  "Countries",
                  unique(sort(df$Country))
          )
        ),
    
      mainPanel(
        # plot histogram
        plotOutput("histogram")
      )
    )
)

# define server
server <- function(input, output) {

  ## QUESTION 2 ##
  #data <- reactive({
   # req(input$country)
    #temp_df <- df %>% filter(Country %in% input$country)
 #   return(temp_df)
  #})
  
#  output$histogram <- renderPlot({
 #   ggplot(data(), aes(x = profit)) + geom_histogram()})
}

# run app
shinyApp(ui = ui, server = server)