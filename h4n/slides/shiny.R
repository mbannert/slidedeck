library(grid)
library(shiny)
source("bullet.R")

ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            numericInput("members", "Number of participants", 8),
            numericInput("rstats", "R / Py", 8),
            numericInput("sql", "SQL", 8),
            numericInput("git", "git", 8)
        ),
        mainPanel(
            plotOutput("lp"),
        )
    )
)


server <- function(input, output){

    output$tp <- renderPlot({
        plot(rnorm(100))
    })

    output$lp <- renderPlot({
        techavg <- mean(c(input$rstats,
                          input$sql,
                          input$git) / input$members)*100
        df1 <- data.frame(units = c("R/Py(%)","SQL(%)","git(%)"),
                          low = c(25,25,25),
                          mean = c(50,50,50),
                          high = c(100,100,100),
                          target = c(techavg,techavg,techavg),
                          value = c(100*(input$rstats/input$members),
                                    100*(input$sql/input$members),
                                    100*(input$git/input$members)
                          )
        )

        g <- gridBulletGraphH(df1,
                              bcol = c("#999999","#CCCCCC","#E1E1E1"),
                              vcol = "#333333", font = 20)

        g + title(paste("Usage of Technologies Among Participants",
                        sep=" "))


    })



}


shinyApp(ui = ui, server = server,
         options = list(port = 1234))
