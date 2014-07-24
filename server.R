library(shiny)
library(nnet)
library(klaR)

data(iris)

train <- iris
mnn <- nnet(Species~., data=train, size=10)
mnb <- NaiveBayes(Species~., data=train)


shinyServer(
  function(input, output) {
    
    output$nameTxt <- renderText({ 
      paste("Name: ", input$name)
    })
    
    output$emailTxt <- renderText({ 
      paste("Email: ", input$email)
    })
    
    output$companyTxt <- renderText({ 
      paste("Company: ", input$company)
    })
    
    output$purposeTxt <- renderText({ 
      paste("Purpose: ", input$purpose)
    })
    
    
    
    output$sLengthTxt <- renderText({ 
      paste("Sepal Length: ", input$sLength, " cm")
    })
    output$sWidthTxt <- renderText({ 
      paste("Sepal Width: ", input$sWidth, " cm")
    })
    output$pLengthTxt <- renderText({ 
      paste("Petal Length: ", input$pLength, " cm")
    })
    output$pWidthTxt <- renderText({ 
      paste("Petal Width: ", input$pWidth, " cm")
    })
    
    
    output$IRISClassNN <- renderText({
      
      
      test <- data.frame(Sepal.Length = input$sLength, Sepal.Width = input$sWidth, Petal.Length = input$pLength, Petal.Width = input$pWidth)
      result <- predict(mnn, test)
      
      paste("Setosa: ", result[,1], " | ","Versicolor: ", result[,2], " | " ,"Virginica: ", result[,3])
      
    })
    
    output$IRISClassNB <- renderText({
      
      
      test <- data.frame(Sepal.Length = input$sLength, Sepal.Width = input$sWidth, Petal.Length = input$pLength, Petal.Width = input$pWidth)
      result <- predict(mnb, test)
      res <- result[[2]]
      
      paste("Setosa: ", res[,1], " | ","Versicolor: ", res[,2], " | " ,"Virginica: ", res[,3])
      
    })
    
    output$IRISClassFinal <- renderText({
      test <- data.frame(Sepal.Length = input$sLength, Sepal.Width = input$sWidth, Petal.Length = input$pLength, Petal.Width = input$pWidth)
      res <- predict(mnb, test)
      ResNB <- res[[2]]
      ResNN <- predict(mnn, test)
      
      nn_max <- NULL
      nb_max <- NULL
      
      if(ResNB[,1] > ResNB[,2] && ResNB[,1] > ResNB[,3]) {
        nb_max <- "Setosa"
      } 
      else if(ResNB[,2] > ResNB[,1] && ResNB[,2] > ResNB[,3]) {
        nb_max <- "Versicolor"
      }
      else {
        nb_max <- "Virginica"
      }
      
      
      if(ResNN[,1] > ResNN[,2] && ResNN[,1] > ResNN[,3]) {
        nn_max <- "Setosa"
      } 
      else if(ResNN[,2] > ResNN[,1] && ResNN[,2] > ResNN[,3]) {
        nn_max <- "Versicolor"
      }
      else {
        nn_max <- "Virginica"  
      }
      
      
      if(nn_max == nb_max) {
        paste("Final Prediction: ", nn_max)
      } else
      {
        paste("Final Prediction: ", nn_max, " or ", nb_max)
      }
        
    })
    
  }
)

