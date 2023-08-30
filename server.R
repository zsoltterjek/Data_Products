library(shiny)
library(ggplot2)

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)

server <- function(input, output, session) {
    
    selectedData <- reactive({
        mtcars[, c(input$xcol, input$ycol, input$color)]
    })
    
    output$plot1 <- renderPlot({
        ggplot(selectedData(), aes_string(x = input$xcol, y = input$ycol, 
                                          color = input$color)) + geom_point(size = 5) +
            scale_color_manual(values = unique(selectedData()[[input$color]]))
    })
}
