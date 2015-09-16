library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  titlePanel("Using Shiny with Survival Package and Cancer Dataset"),
  
  sidebarPanel(
    
    radioButtons("obs", "Select censoring status:",
                 c("Censored" = "1",
                   "Dead" = "2")),
    br(),
    p("Codebook - Output from:"),
    code("?cancer"),
    p("inst:	 Institution coderun"),
    p("time:	 Survival time in days"),
    p("status:	 censoring status 1=censored, 2=dead"),
    p("age:	 Age in years"),
    p("sex:	 Male=1 Female=2"),
    p("ph.ecog:	 ECOG performance score (0=good 5=dead)"),
    p("ph.karno:	 Karnofsky performance score (bad=0-good=100) rated by physician"),
    p("pat.karno:	 Karnofsky performance score as rated by patient"),
    p("meal.cal:	 Calories consumed at meals"),
    p("wt.loss:	 Weight loss in last six months")
),

  mainPanel(
    h4("Plots"),
    plotOutput("plot"),
    h4("Console"),
    verbatimTextOutput("console")
  )
))  
