# Shiny Dashboard
library(shinydashboard)
library(DT)
library(plotly)
source('global.R', local = TRUE)
source('./views/home.R', local = TRUE)
source('./views/data.R', local = TRUE)

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

ui <- dashboardPage(
  dashboardHeader(title = "My Shiny Dashboard"),
  dashboardSidebar(
    sidebarMenu( id = 'sidebar',
                 menuItem("Home", tabName = "home", icon = icon("home")),
                 menuItem("Data", tabName = "data", icon = icon("table"))
    ),
    conditionalPanel(
      condition = "input.sidebar == 'data'",
      dateRangeInput(inputId = "dates",
                     label = "Date range:",
                     start = seq(Sys.Date(), length = 2, by = "-5 months")[2],
                     end = Sys.Date(),
                     min = "2018-01-01")
    ),
    conditionalPanel(
      condition = "input.sidebar == 'data'",
      selectInput(inputId = "chart",
                  label = "Chart type:",
                  choices = c("area", "bar", "line"),
                  selected = "area")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              homeViewUI("home_view")
      ),
      tabItem(tabName = "data",
              dataViewUI("data_view")
      )
    )
  )
)

server <- function(input, output) {
  # Home Tab #
  callModule(homeView, "home_view")
  
  # Data Tab #
  callModule(dataView, "data_view", dates = reactive(input$dates), chart = reactive(input$chart))
}

shinyApp(ui, server)