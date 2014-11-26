library(markdown)
shinyUI(fluidPage(
    titlePanel('Graphical manipulation'),
    fluidRow(
        column(4, wellPanel(
            selectInput('xcol', 'X Variable', names(iris)),
            selectInput('ycol', 'Y Variable', names(iris),
                        selected=names(iris)[[2]]),
            helpText('This is an exercise to see some of the shiny features.',
                     'It used the iris dataset to show the result of a k-mean
                     analysis.',
                     'First, pick the variable to use on the k-means anlysis.'),
            helpText(
                     'It is also possible to choose the number of clusters to 
                     used on the analysis.'
                     ),
            helpText('You can also costumize several aspects of the graphic:',
                     'the shape and size of the dot representing the data',
                     'and also the title and labels of the axis.'),
            helpText('Check the pitch presentation in: http://rpubs.com/pmeads/dppapp')
            )),
        column(8, wellPanel(
            plotOutput('plot1')
        ))
        ),
    fluidRow(
        column(3, wellPanel(
            h5("graphical details"),
            sliderInput('clusters',
                        h6("Number of Clusters"),
                        min = 1, max = 9, value = 3, step = 1,
                        animate = animationOptions(interval = 300, loop = TRUE)
                        ),
            sliderInput("pchs",
                        h6("Choose the point type to use on the graph"),
                        min = 0, max = 25, value = 20, step = 1,
                        animate = animationOptions(interval = 600, loop = TRUE)
                        ),
            sliderInput("cexs", h6("Now choose the point display size"),
                            min = 1, max = 24, value = 5, step = 1,
                            animate = animationOptions(interval = 1000, loop = TRUE))
            )),
        column(3, wellPanel(
            h5("graph costumization"),
            textInput("title", label = h6("plot title"), value = "Iris k-means clustering"),
            textInput("xlab", label = h6("horizontal label"), value = names(iris)[[1]]),
            textInput("ylab", label = h6("vertical label"), value = names(iris)[[2]])
            ))
        ),
    fluidRow(
        column(12, wellPanel(
            includeMarkdown("./presenting.md")
        ))
        )
))