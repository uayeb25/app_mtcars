library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(fluidPage(
    title = 'MT Cars Exploratory',
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput('show_vars', 'Columns in mtcars to show:',
                               names(mtcars), selected = names(mtcars)),
            sliderInput("mpg", "MPG", 10, 34, value = c(10, 34))
        ),
        mainPanel(
            tabsetPanel(
                id = 'dataset',
                tabPanel('Data', DT::dataTableOutput('mytable1')),
                tabPanel('Plot', plotOutput('newBP'))
            )
        )
    )
))


summary(mtcars)
