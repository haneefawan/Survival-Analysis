library(shiny)
library(datasets)
library(survival)
data <- cancer

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    
    # Create survival object
    # The response variable (Surv) taking start time
    # stop time
    # event = t/f
    data$survival_object <- with(data, Surv(time, status == input$obs)) 
    
    # BUilding the model. Fit Cox Regression
    fit_cox <- coxph(survival_object ~ age + sex + ph.karno + wt.loss, data =  data)   

    # Plot graph of scaled residuals, testing hypothesis for proportional hazards.
    par(mfrow=c(1, 4)) 
    plot(cox.zph(fit_cox))

    output$console <- renderPrint({
      summary(fit_cox)
    })
  })
})