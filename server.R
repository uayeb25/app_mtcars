library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    mtcars2 <- reactive({
        # choose columns to display
        mtcars$am <- as.factor(mtcars$am)
        minMPG <- input$mpg[1]
        maxyMPG <- input$mpg[2]

        tmp <- subset(mtcars, mpg >= minMPG & mpg <= maxyMPG)
        tmp[,input$show_vars, drop = FALSE]
    })


    output$mytable1 <- DT::renderDataTable({
        DT::datatable(mtcars2())
    })

    output$newBP <- renderPlot({
        ggplot(mtcars2(),aes(am,mpg,am,fill=am))+geom_boxplot()
    })


})
