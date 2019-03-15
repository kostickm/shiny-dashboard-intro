# Home View

homeViewUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  # Return a piece of the UI
  # namespace the id by wrapping it in 'ns()'
  uiOutput(ns("home_view"))
}

homeView <- function(input, output, session) {
  output$home_view <- renderUI({
    ns <- session$ns
    
    tagList(
      h2("Home"),
      fluidRow(
        infoBox("Progress", "35%", icon = icon("list"), color = "purple"),
        infoBox("Count Down", "24 Days", icon = icon("calendar"), color = "yellow"),
        infoBox("Cost", "$63,000", icon = icon("money"), color = "green")
      ),
      fluidRow(
        valueBox("35%", "Progress", icon = icon("list"), color = "purple"),
        valueBox("24 Days", "Count Down", icon = icon("calendar"), color = "yellow"),
        valueBox("$63,000", "Cost", icon = icon("money"), color = "green")
      ))
  })
}