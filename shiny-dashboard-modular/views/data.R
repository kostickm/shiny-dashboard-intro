# Data View

dataViewUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  # Return a piece of the UI
  # namespace the id by wrapping it in 'ns()'
  uiOutput(ns("data_view"))
}

dataView <- function(input, output, session, dates, chart) {
  output$data_view <- renderUI({
    ns <- session$ns
    
    tagList(
      h2("Data"),
      fluidRow(
        tabBox(
          tabPanel("Plot", plotlyOutput(ns("plot1"), height = 400)),
          tabPanel("Data", DT::dataTableOutput(ns("raw_data")), downloadButton(ns("downloadData"), "Download"))
        ), width = 8
      )
    )
  })
  
  # Reactively get data from the database
  total_data <- reactive({
    query <- paste0("SELECT date, total FROM testmegan WHERE date >= '", dates()[1], "' AND date <= '", dates()[2], "' ORDER BY date DESC")
    data <- dbGetQuery(pool, query)
    return(data)
  })
  
  chart_type <- reactive({
    if (chart() == 'bar') {
      'bar'
    } else {
      'scatter'
    }
  })
  
  chart_mode <- reactive({
    if (chart() == 'bar') {
      NULL
    } else {
      'lines+markers'
    }
  })
  
  chart_fill <- reactive({
    if (chart() == 'area') {
      'tozeroy'
    } else {
      NULL
    }
  })
  
  output$plot1 <- renderPlotly({
    plot_ly(
      total_data(),
      x = ~date,
      y = ~total,
      type = chart_type(),
      mode = chart_mode(),
      fill = chart_fill()
    ) %>%
      layout(
        title = "My Graph",
        margin = list(t = 50, r = 50, l = 50),
        xaxis = list(title = "Date", tickangle = 45),
        yaxis = list(title = "Total")
      )
  })
  
  output$raw_data <- DT::renderDataTable(
    total_data(),
    rownames = FALSE
  )
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste('totalData_', Sys.Date(), '.csv', sep='')
    },
    content = function(file) {
      write.csv(total_data(), file, row.names = FALSE)
    }
  )
}