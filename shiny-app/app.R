library(shiny)

# STEP 1 - Basic App Structure
# Define UI
# ui <- fluidPage(
#   h2("Hello World!")
# )
# 
# # Define Server
# server <- function(input, output) {
# 
# }

# STEP 2 - Reactivity
# pet_data <- data.frame('type' = c('cat', 'dog', 'pig', 'horse', 'cat'),
#                        'name' = c('Missy', 'Toby', 'Porky', 'Jasmine', 'Sparkle'),
#                        'age' = c(2, 9, 1, 5, 12),
#                        'color' = c('brown', 'black', 'pink', 'white', 'black'))
# 
# # Define UI
# ui <- fluidPage(
#   headerPanel('Pets'),
#   sidebarPanel(
#     selectInput('name',
#                 label = 'Pet Name',
#                 choices = unique(pet_data$name),
#                 selected = 'Missy')
#   ),
#   mainPanel(
#     h4("Name:"),
#     textOutput('pet_name'),
#     h4("Type:"),
#     textOutput('pet_type'),
#     h4("Age:"),
#     textOutput('pet_age'),
#     h4("Color:"),
#     textOutput('pet_color')
#   )
# )
# 
# # Define Server
# server <- function(input, output) {
#   output$pet_name <- renderText({
#     input$name
#   })
# 
#   output$pet_type <- renderText({
#     paste(pet_data[pet_data$name == input$name,]$type)
#   })
# 
#   output$pet_age <- renderText({
#     paste(pet_data[pet_data$name == input$name,]$age)
#   })
# 
#   output$pet_color <- renderText({
#     paste(pet_data[pet_data$name == input$name,]$color)
#   })
# }

# STEP 3 - Full Plot Example from Shiny Gallery: https://shiny.rstudio.com/gallery/kmeans-example.html
# palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
#           "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
# 
# ui <- fluidPage(
#   headerPanel('Iris k-means clustering'),
#   sidebarPanel(
#     selectInput('xcol', 'X Variable', names(iris)),
#     selectInput('ycol', 'Y Variable', names(iris),
#                 selected = names(iris)[[2]]),
#     numericInput('clusters', 'Cluster count', 3,
#                  min = 1, max = 9)
#   ),
#   mainPanel(
#     plotOutput('plot1')
#   )
# )
# 
# server <- function(input, output) {
#   selectedData <- reactive({
#     iris[, c(input$xcol, input$ycol)]
#   })
#   
#   clusters <- reactive({
#     kmeans(selectedData(), input$clusters)
#   })
#   
#   output$plot1 <- renderPlot({
#     par(mar = c(5.1, 4.1, 0, 1))
#     plot(selectedData(),
#          col = clusters()$cluster,
#          pch = 20, cex = 3)
#     points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
#   })
# }

shinyApp(ui = ui, server = server)