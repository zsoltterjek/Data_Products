library(shiny)

vars_axis <- setdiff(names(mtcars), c("cyl", "disp", "drat", "vs", "am", 
                                      "gear", "carb"))
vars_color <- setdiff(names(mtcars), c("mpg", "disp", "drat", "qsec", "hp", "wt", 
                                       "carb"))

pageWithSidebar(
    headerPanel('Mtcars scatter plotting'),
    sidebarPanel(
        selectInput('xcol', 'X Variable', vars_axis),
        selectInput('ycol', 'Y Variable', vars_axis, selected = vars_axis[[2]]),
        radioButtons('color', 'Color',
                           c("Cyl number" = "cyl",
                             "Automatic or Manual" = "am",
                             "V-shaped or straight engine" = "vs",
                             "Forward gears number" = "gear"),
                           selected = "cyl"),
    ),
    mainPanel(plotOutput('plot1'))
)
