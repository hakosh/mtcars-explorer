library(shiny)

choices = list(
  'Miles/(US) gallon' = 'mpg',
  'Number of cylinders' = 'cyl',
  'Displacement (cu.in.)' = 'disp',
  'Gross horsepower' = 'hp',
  'Rear axle ratio' = 'drat',
  'Weight (lb/1000)' = 'wt',
  '1/4 mile time' = 'qsec',
  'V/S' = 'vs',
  'Transmission (0 = automatic, 1 = manual)' = 'am',
  'Number of forward gears' = 'gear',
  'Number of carburetors' = 'carb'
);

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel('mtcars explorer'),

    sidebarLayout(
      sidebarPanel(
        selectInput('x_axis', label = h4('X Axis'), choices),
        selectInput('y_axis', label = h4('Y Axis'), choices, selected = 'cyl'),
        checkboxInput('include_line', label = 'Regression line', value = TRUE)
      ),
      mainPanel(
        plotOutput('cars_plot'),
        h4('Included elements'),
        tableOutput('cars_table'),
        tags$head(tags$style('table.data { width: 99%; margin: 0 0 3% 0; }', media='screen', type="text/css"))
      )
    )
))
