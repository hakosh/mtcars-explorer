library(shiny)
library(ggplot2)
library(datasets)

data(mtcars)

properties <- rbind(
  'Miles/(US) gallon',
  'Number of cylinders',
  'Displacement (cu.in.)',
  'Gross horsepower',
  'Rear axle ratio',
  'Weight (lb/1000)',
  '1/4 mile time',
  'V/S',
  'Transmission (0 = automatic, 1 = manual)',
  'Number of forward gears',
  'Number of carburetors'
)

row.names(properties) <- rbind(
  'mpg',
  'cyl',
  'disp',
  'hp',
  'drat',
  'wt',
  'qsec',
  'vs',
  'am',
  'gear',
  'carb'
)

shinyServer(function(input, output) {

  output$cars_table <- renderTable(mtcars)
  output$cars_plot <- renderPlot({
    x_axis = mtcars[, input$x_axis]
    y_axis = mtcars[, input$y_axis]

    plot <- ggplot(mtcars, aes_string(x = input$x_axis, y = input$y_axis)) +
            geom_point(colour = '#319ded', size = 4) +
            xlab(properties[input$x_axis, ]) +
            ylab(properties[input$y_axis, ]) +
            ggtitle('Motor Trend Car Road Tests');
    

    if (input$include_line) {
      fit <- lm(y_axis ~ x_axis)
      cf <- coef(fit)
      plot <- plot + geom_abline(intercept = cf[1], slope = cf[2], colour = '#00d455', size = 1, alpha = 0.7)
    }

    print(plot)
  })
})
