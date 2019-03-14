# Shiny Dashboard
library(shinydashboard)
library(DT)
library(plotly)
source('global.R', local = TRUE)

# EXAMPLE: Connecting to PostgreSQL (Found in global.R)
# pool <- dbPool(
#   drv = dbDriver("PostgreSQL", max.con = 15),
#   dbname = "<db_name>",
#   host = "<db_host>",
#   port = <db_port>,
#   user = "<db_user>",
#   password = "<db_password",
#   idleTimeout = 3600000
# )
# 
# onStop(function() {
#   poolClose(pool)
# })



# STEP 1 - Basic Layout
# ui <- dashboardPage(
#   dashboardHeader(),
#   dashboardSidebar(),
#   dashboardBody()
# )
# 
# server <- function(input, output) {
#   
# }

# STEP 2 - Header and Sidebar Layout - Adding Tabs
# ui <- dashboardPage(
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#       menuItem("Home", tabName = "home", icon = icon("home")),
#       menuItem("Data", tabName = "data", icon = icon("table"))
#     )
#   ),
#   dashboardBody()
# )
# 
# server <- function(input, output) {
#   
# }

# STEP 3 - Body Layout - Row Based Layout (Column based also exists)
# ui <- dashboardPage(
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#                  menuItem("Home", tabName = "home", icon = icon("home")),
#                  menuItem("Data", tabName = "data", icon = icon("table"))
#     )
#   ),
#   dashboardBody(
#     tabItems(
#       tabItem(tabName = "home",
#         h2("Home"),
#         fluidRow(
#           infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
#           infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
#           infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
#         ),
#         fluidRow(
#           valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
#           valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
#           valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
#         )
#       ),
#       tabItem(tabName = "data",
#         h2("Data"),
#         fluidRow(
#           box(title = "Plot 1", status = "primary", solidHeader = TRUE, collapsible = TRUE,
#               plotlyOutput("plot1", height = 350), width = 6),
#           box(title = "Plot 2", status = "warning", solidHeader = FALSE,
#             plotlyOutput("plot2", height = 350), width = 6)
#         ),
#         fluidRow(
#           box(title = "Plot 3", "Details about this plot.",
#             plotlyOutput("plot3"), width = 4, height = 300),
#           box(title = "Plot 4", background = "black",
#               plotlyOutput("plot4"), width = 4, height = 300),
#           box(plotlyOutput("plot5"), width = 4, height = 300)
#         )
#       )
#     )
#   )
# )
# 
# server <- function(input, output) {
#   
# }

# STEP 4 - Check boxes, drop downs, sliders, etc
# ui <- dashboardPage(
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#                  menuItem("Home", tabName = "home", icon = icon("home")),
#                  menuItem("Data", tabName = "data", icon = icon("table"))
#     ),
#     dateRangeInput(inputId = "dates",
#                    label = "Date range:",
#                    start = seq(Sys.Date(), length = 2, by = "-5 months")[2],
#                    end = Sys.Date(),
#                    min = "2018-01-01"),
#     sliderInput(inputId = "slider",
#                 label = "Value",
#                 min = 0,
#                 max = 250,
#                 value = 100),
#     selectInput(inputId = "chart",
#                 label = "Chart type:",
#                 choices = c("area", "bar", "line"),
#                 selected = "area"),
#     textInput(inputId = "text", label = "Text Field"),
#     checkboxInput(inputId = "checkbox",
#                   label = "Paid",
#                   value = FALSE)
#   ),
#   dashboardBody(
#     tabItems(
#       tabItem(tabName = "home",
#               h2("Home"),
#               fluidRow(
#                 infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
#                 infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
#                 infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
#               ),
#               fluidRow(
#                 valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
#                 valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
#                 valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
#               )
#       ),
#       tabItem(tabName = "data",
#               h2("Data"),
#               fluidRow(
#                 box(title = "Plot 1", status = "primary", solidHeader = TRUE, collapsible = TRUE,
#                     plotlyOutput("plot1", height = 350), width = 6),
#                 box(title = "Plot 2", status = "warning", solidHeader = FALSE,
#                     plotlyOutput("plot2", height = 350), width = 6)
#               ),
#               fluidRow(
#                 box(title = "Plot 3", "Details about this plot.",
#                     plotlyOutput("plot3"), width = 4, height = 300),
#                 box(title = "Plot 4", background = "black",
#                     plotlyOutput("plot4"), width = 4, height = 300),
#                 box(plotlyOutput("plot5"), width = 4, height = 300)
#               )
#       )
#     )
#   )
# )
# 
# server <- function(input, output) {
#   
# }

# STEP 5 - Plotting and conditionalPanel - different plotting libraries, I use plotly
# ui <- dashboardPage(
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#                  menuItem("Home", tabName = "home", icon = icon("home")),
#                  menuItem("Data", tabName = "data", icon = icon("table"))
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       dateRangeInput(inputId = "dates",
#                      label = "Date range:",
#                      start = seq(Sys.Date(), length = 2, by = "-5 months")[2],
#                      end = Sys.Date(),
#                      min = "2018-01-01")
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       selectInput(inputId = "chart",
#                   label = "Chart type:",
#                   choices = c("area", "bar", "line"),
#                   selected = "area")
#     )
#   ),
#   dashboardBody(
#     tabItems(
#       tabItem(tabName = "home",
#               h2("Home"),
#               fluidRow(
#                 infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
#                 infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
#                 infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
#               ),
#               fluidRow(
#                 valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
#                 valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
#                 valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
#               )
#       ),
#       tabItem(tabName = "data",
#               h2("Data"),
#               fluidRow(
#                 box(title = "Plot 1", status = "primary", solidHeader = TRUE, collapsible = TRUE,
#                     plotlyOutput("plot1", height = 400), width = 8)
#               )
#       )
#     )
#   )
# )
# 
# server <- function(input, output) {
#   # Reactively get data from the database
#   total_data <- reactive({
#     query <- paste0("SELECT date, total FROM testmegan WHERE date >= '", input$dates[1], "' AND date <= '", input$dates[2], "' ORDER BY date DESC")
#     data <- dbGetQuery(pool, query)
#     return(data)
#   })
#   
#   chart_type <- reactive({
#     if (input$chart == 'bar') {
#       'bar'
#     } else {
#       'scatter'
#     }
#   })
#   
#   chart_mode <- reactive({
#     if (input$chart == 'bar') {
#       NULL
#     } else {
#       'lines+markers'
#     }
#   })
#   
#   chart_fill <- reactive({
#     if (input$chart == 'area') {
#       'tozeroy'
#     } else {
#       NULL
#     }
#   })
#   
#   output$plot1 <- renderPlotly({
#     plot_ly(
#       total_data(),
#       x = ~date,
#       y = ~total,
#       type = chart_type(),
#       mode = chart_mode(),
#       fill = chart_fill()
#     ) %>%
#       layout(
#         title = "My Graph",
#         margin = list(t = 50, r = 50, l = 50),
#         xaxis = list(title = "Date", tickangle = 45),
#         yaxis = list(title = "Total")
#       )
#   })
# }

# STEP 6 - Data Tables / Downloads
# ui <- dashboardPage(
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#                  menuItem("Home", tabName = "home", icon = icon("home")),
#                  menuItem("Data", tabName = "data", icon = icon("table"))
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       dateRangeInput(inputId = "dates",
#                      label = "Date range:",
#                      start = seq(Sys.Date(), length = 2, by = "-5 months")[2],
#                      end = Sys.Date(),
#                      min = "2018-01-01")
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       selectInput(inputId = "chart",
#                   label = "Chart type:",
#                   choices = c("area", "bar", "line"),
#                   selected = "area")
#     )
#   ),
#   dashboardBody(
#     tabItems(
#       tabItem(tabName = "home",
#               h2("Home"),
#               fluidRow(
#                 infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
#                 infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
#                 infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
#               ),
#               fluidRow(
#                 valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
#                 valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
#                 valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
#               )
#       ),
#       tabItem(tabName = "data",
#               h2("Data"),
#               fluidRow(
#                 tabBox(
#                   tabPanel("Plot", plotlyOutput("plot1", height = 400)),
#                   tabPanel("Data", DT::dataTableOutput("raw_data"), downloadButton("downloadData", "Download"))
#                 ), width = 8
#               )
#       )
#     )
#   )
# )
# 
# server <- function(input, output) {
#   # Reactively get data from the database
#   total_data <- reactive({
#     query <- paste0("SELECT date, total FROM testmegan WHERE date >= '", input$dates[1], "' AND date <= '", input$dates[2], "' ORDER BY date DESC")
#     data <- dbGetQuery(pool, query)
#     return(data)
#   })
#   
#   chart_type <- reactive({
#     if (input$chart == 'bar') {
#       'bar'
#     } else {
#       'scatter'
#     }
#   })
#   
#   chart_mode <- reactive({
#     if (input$chart == 'bar') {
#       NULL
#     } else {
#       'lines+markers'
#     }
#   })
#   
#   chart_fill <- reactive({
#     if (input$chart == 'area') {
#       'tozeroy'
#     } else {
#       NULL
#     }
#   })
#   
#   output$plot1 <- renderPlotly({
#     plot_ly(
#       total_data(),
#       x = ~date,
#       y = ~total,
#       type = chart_type(),
#       mode = chart_mode(),
#       fill = chart_fill()
#     ) %>%
#       layout(
#         title = "My Graph",
#         margin = list(t = 50, r = 50, l = 50),
#         xaxis = list(title = "Date", tickangle = 45),
#         yaxis = list(title = "Total")
#       )
#   })
#   
#   output$raw_data <- DT::renderDataTable(
#     total_data(),
#     rownames = FALSE
#   )
#   
#   output$downloadData <- downloadHandler(
#     filename = function() {
#       paste('totalData_', Sys.Date(), '.csv', sep='')
#     },
#     content = function(file) {
#       write.csv(total_data(), file, row.names = FALSE)
#     }
#   )
# }

# STEP 8 - CSS Styling / Skins
# ui <- dashboardPage(
#   #skin = "green",
#   dashboardHeader(title = "My Shiny Dashboard"),
#   dashboardSidebar(
#     sidebarMenu( id = 'sidebar',
#                  menuItem("Home", tabName = "home", icon = icon("home")),
#                  menuItem("Data", tabName = "data", icon = icon("table"))
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       dateRangeInput(inputId = "dates",
#                      label = "Date range:",
#                      start = seq(Sys.Date(), length = 2, by = "-5 months")[2],
#                      end = Sys.Date(),
#                      min = "2018-01-01")
#     ),
#     conditionalPanel(
#       condition = "input.sidebar == 'data'",
#       selectInput(inputId = "chart",
#                   label = "Chart type:",
#                   choices = c("area", "bar", "line"),
#                   selected = "area")
#     )
#   ),
#   dashboardBody(
#     # tags$head(
#     #   tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
#     # ),
#     tabItems(
#       tabItem(tabName = "home",
#               h2("Home"),
#               fluidRow(
#                 infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
#                 infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
#                 infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
#               ),
#               fluidRow(
#                 valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
#                 valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
#                 valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
#               )
#       ),
#       tabItem(tabName = "data",
#               h2("Data"),
#               fluidRow(
#                 tabBox(
#                   tabPanel("Plot", plotlyOutput("plot1", height = 400)),
#                   tabPanel("Data", DT::dataTableOutput("raw_data"), downloadButton("downloadData", "Download"))
#                 ), width = 8
#               )
#       )
#     )
#   )
# )
# 
# server <- function(input, output) {
#   # Reactively get data from the database
#   total_data <- reactive({
#     query <- paste0("SELECT date, total FROM testmegan WHERE date >= '", input$dates[1], "' AND date <= '", input$dates[2], "' ORDER BY date DESC")
#     data <- dbGetQuery(pool, query)
#     return(data)
#   })
#   
#   chart_type <- reactive({
#     if (input$chart == 'bar') {
#       'bar'
#     } else {
#       'scatter'
#     }
#   })
#   
#   chart_mode <- reactive({
#     if (input$chart == 'bar') {
#       NULL
#     } else {
#       'lines+markers'
#     }
#   })
#   
#   chart_fill <- reactive({
#     if (input$chart == 'area') {
#       'tozeroy'
#     } else {
#       NULL
#     }
#   })
#   
#   output$plot1 <- renderPlotly({
#     plot_ly(
#       total_data(),
#       x = ~date,
#       y = ~total,
#       type = chart_type(),
#       mode = chart_mode(),
#       fill = chart_fill()
#     ) %>%
#       layout(
#         title = "My Graph",
#         margin = list(t = 50, r = 50, l = 50),
#         xaxis = list(title = "Date", tickangle = 45),
#         yaxis = list(title = "Total")
#       )
#   })
#   
#   output$raw_data <- DT::renderDataTable(
#     total_data(),
#     rownames = FALSE
#   )
#   
#   output$downloadData <- downloadHandler(
#     filename = function() {
#       paste('totalData_', Sys.Date(), '.csv', sep='')
#     },
#     content = function(file) {
#       write.csv(total_data(), file, row.names = FALSE)
#     }
#   )
# }

shinyApp(ui, server)