library(shiny)

shinyUI(fluidPage(
  
  titlePanel("IRIS Predictor 1.0.0"),
  helpText("IRIS Predictor is a web application that predicts the IRIS flower type (Setosa, 
               Versicolor, Virginica) based on the flower Sepal and Petal width and length, 
           leveraging on both Neural Network and Naive Bayes Algorithms. The application aims 
           to generate plain text report to ease the process of embedding into other documents. 
           The right panel is the input of your IRIS flower porperties, whilst teh Right Panel 
           is the generated report that will update itself realtime whenever you change your input. "),
  br(),
  br(), 
  br(),
  
  sidebarLayout(
    sidebarPanel(
      
      h5("Personal Information"),
      helpText("Personal Information are Optional, but they will be displayed 
               on Generated Report on the Right. "),
      textInput("name", label = h6("Name: "), value = "Anonymous"),
      textInput("email", label = h6("Email: "), value = "Anonymous@companyname.com"),
      textInput("company", label = h6("Company: "), value = "Company Name"),
      
      
      selectInput("purpose", label = h6("Purpose"), 
                  choices = list("Research" = 1, "Commercial" = 2, "Education" = 3, "Other" = 4), 
                  selected = 4),
      helpText("Your intention for using this application"),
                  
      br(),
      br(),
      h5("IRIS Properties"),
      helpText("Your IRIS Flower Characteristics, all in cm. "),
      sliderInput("sLength", label = h6("Sepal Length: "), min = 0, max = 10, value = 5.1, step = 0.1),
      sliderInput("sWidth", label = h6("Sepal Width: "), min = 0, max = 10, value = 3.5, step = 0.1),
      sliderInput("pLength", label = h6("Petal Length: "), min = 0, max = 10, value = 1.4, step = 0.1),
      sliderInput("pWidth", label = h6("Petal Width: "), min = 0, max = 5, value = 0.2, step = 0.1), 
      br(), 
      img(src = "http://mirlab.org/jang/books/dcpr/image/iris.gif")
    ),
    
    mainPanel(
      h5("Generated Report", align="center"),
      br(), 
      p("==============================================="),
      textOutput("nameTxt"),
      textOutput("emailTxt"),
      textOutput("companyTxt"), 
      textOutput("purposeTxt"), 
      helpText("(1- Research, 2 - Commercial, 3 - Education, 4 - Other)"),
      p("==============================================="), 
      
      br(),
      p("IRIS Properties: "),
      p("--------------------"),
      br(),
      textOutput("sLengthTxt"),
      textOutput("sWidthTxt"),
      textOutput("pLengthTxt"),
      textOutput("pWidthTxt"),
      
      br(),
      br(),
      p("Predictions: "),
      p("----------------"),
      
      br(),
      p("Neural Networks: "),
      textOutput("IRISClassNN"),
      
      br(),
      p("Naive Bayes: "),
      textOutput("IRISClassNB"),
      
      br(),
      br(),
      strong("***Final*** "),
      textOutput("IRISClassFinal"),
      
      br(),
      br(),
      p("References: "),
      p("----------------"),
      
      img(src = "http://mirlab.org/jang/books/dcpr/image/Iris-setosa-10_1.jpg", width="150"),
      img(src = "http://mirlab.org/jang/books/dcpr/image/Iris-versicolor-21_1.jpg", width="150"),
      img(src = "http://mirlab.org/jang/books/dcpr/image/Iris-virginica-3_1.jpg", width="150"),
      p("Setosa | Versicolor | Virginica"),
      br(),
      em("1.) 2-2 Iris Dataset. (n.d.). 2-2 Iris Dataset. Retrieved July 24, 2014, from http://mirlab.org/jang/books/dcpr/dataSetIris.asp?title=2-2%20Iris%20Dataset")
    )
  )
))



