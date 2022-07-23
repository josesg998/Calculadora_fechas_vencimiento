library(shiny)
library(bizdays)
library(lubridate)


feriados <- as.Date(
  c("01/01/2013","11/02/2013","12/02/2013","29/03/2013","01/04/2013","02/04/2013","01/05/2013", 
    "20/06/2013","21/06/2013","09/07/2013","19/08/2013","14/10/2013","25/11/2013","25/12/2013",
    "01/01/2014","03/03/2012","04/03/2012","24/03/2012","02/04/2013","18/04/2014","01/05/2014",
    "20/06/2014","09/07/2014","18/08/2014","13/10/2014","24/11/2014","08/12/2014","25/12/2014",
    "01/01/2015","16/02/2015","17/02/2015","23/03/2015","24/03/2015","02/04/2015","03/04/2015",
    "01/05/2015","25/05/2015","20/06/2015","01/01/2015","09/07/2015","17/08/2015","12/10/2015",
    "23/11/2015","07/12/2015","08/12/2015","01/01/2016","08/02/2016","09/02/2016","24/03/2016",
    "25/03/2016","25/05/2016","17/06/2016","08/07/2016","15/08/2016","10/10/2016","28/11/2016",
    "08/12/2016","09/12/2016","27/02/2017","28/02/2017","24/03/2017","13/04/2017","14/04/2017",
    "01/05/2017","25/05/2017","20/06/2017","21/08/2017","16/10/2017","20/11/2017","08/12/2017",
    "25/12/2017","01/01/2018","12/02/2018","13/02/2018","29/03/2018","30/03/2018","02/04/2018",
    "30/04/2018","01/05/2018","25/05/2018","20/06/2018","09/07/2018","20/08/2018","15/10/2018",
    "19/11/2018","24/12/2018","25/12/2018","31/12/2018","01/01/2019","04/03/2019","05/03/2019",
    "02/04/2019","18/04/2019","19/04/2019","01/05/2019","17/06/2019","20/06/2019","08/07/2019",
    "09/07/2019","19/08/2019","14/10/2019","18/11/2019","25/12/2019","01/01/2020","24/02/2020",
    "25/02/2020","23/03/2020","24/03/2020","31/03/2020","09/04/2020","10/04/2020","24/04/2020",
    "01/05/2020","25/05/2020","15/06/2020","20/06/2020","09/07/2020","10/07/2020","17/08/2020",
    "12/10/2020","23/11/2020","07/12/2020","08/12/2020","24/12/2020","25/12/2020","31/12/2020",
    "01/01/2021","15/02/2021","16/02/2021","24/03/2021","01/04/2021","02/04/2021","01/05/2021",
    "24/05/2021",
    "25/05/2021","20/06/2021","21/06/2021","09/07/2021","16/08/2021","08/10/2021","11/10/2021",
    "20/11/2021","22/11/2021","08/12/2021","24/12/2021","25/12/2021","31/12/2021",
    "01/01/2022","28/02/2022","01/03/2022","24/03/2022","14/04/2022","15/04/2022","25/05/2022",
    "20/06/2022","09/07/2022","15/08/2022","10/10/2022","28/11/2022","08/12/2022"), format= "%d/%m/%Y")
cal <- create.calendar("ArgCal", holidays=feriados, weekdays=c("saturday", "sunday"), 
                       start.date=ymd("2013-01-01"), end.date=ymd("2022-12-31"))


# Define UI for application that draws a histogram
ui <- fluidPage(
  includeCSS("tema.css"),
  
    # Application title
    titlePanel(h1("Calculadora de fechas de vencimiento")),
    tabsetPanel(
      tabPanel(title="Ley 104",
          sidebarLayout(
              sidebarPanel(
                  dateInput("fecha",
                            h5(" Elegí la fecha de inicio de expediente:"),
                            language = "es",
                            daysofweekdisabled = c(6,0),
                            datesdisabled = feriados),
                  h4(textOutput("advertencia"))
              ),
              mainPanel(
                textOutput("explicacion"),
                h3(textOutput("vencimiento1")),
                h3(textOutput("vencimiento2"))
),
              ),
          ),
    tabPanel(title="Defensoría",
             sidebarLayout(
               sidebarPanel(
                 dateInput("fechadef",
                           h5("Elegí la fecha de inicio de expediente:"),
                           language = "es",
                           daysofweekdisabled = c(6,0),
                           datesdisabled = feriados),
                 h4(textOutput("advertencia2"))
               ),
               mainPanel(
                 textOutput("explicaciondef"),
                 h3(textOutput("vencimiento5")),
                 h3(textOutput("vencimiento10")),
                 h3(textOutput("vencimiento15")),
                 h3(textOutput("vencimiento20")),
                 h3(textOutput("vencimiento30"))
               )
             ))
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$vencimiento1 <- renderText({
      paste0("Primer fecha de vencimiento: ",as.character(as.Date(offset(input$fecha,15, cal)),format="%d/%m/%Y"))
    })
    
    output$vencimiento2 <- renderText({
      paste0("Segunda fecha de vencimiento: ",as.character(as.Date(offset(input$fecha,25, cal)),format="%d/%m/%Y"))
    })
    
    output$explicacion <- renderText({
      "La idea de esta aplicación es ayudar en el cálculo de las fechas de vencimiento de los expedientes de solicitudes de Acceso a la Información Pública. 
      Para realizar el cálculo de la primera fecha de vencimiento se calculan 15 días hábiles desde la fecha ingresada, mientras que para la segunda fecha de vencimiento se toman 25 días hábiles 
      después de la fecha ingresada. Para hacer este cálculo se excluyen los sábados, los domingos y los  feriados."
      
    })
    
    output$explicaciondef <- renderText({
      "La idea de esta aplicación es ayudar en el cálculo de las fechas de vencimiento de los expedientes de solicitudes a la Defensoría del Pueblo de la Ciudad de Buenos Aires. 
      Aquí abajo se muestran las distintas fechas de vencimiento para los expedientes, indicando cuántos días hábiles tiene de distancia con la fecha de generación del expediente
      "
    })
    
    output$advertencia <- renderText({
      "ADVERTENCIA: si bien la aplicación permite buscar fechas de 2022, aún no están chequeadas las fechas de los feriados de ese año."

    })
    
    output$advertencia2 <- renderText({
      "ADVERTENCIA: si bien la aplicación permite buscar fechas de 2022, aún no están chequeadas las fechas de los feriados de ese año."
      
    })
    
    
    
    output$vencimiento5 <- renderText({
      paste0("Cinco días hábiles desde el ingreso: ",as.character(as.Date(offset(input$fechadef,5, cal)),format="%d/%m/%Y"))
    })
    
    output$vencimiento10<- renderText({
      paste0("Diez días hábiles desde el ingreso: ",as.character(as.Date(offset(input$fechadef,10, cal)),format="%d/%m/%Y"))
    })
    
    output$vencimiento15 <- renderText({
      paste0("Quince días hábiles desde el ingreso: ",as.character(as.Date(offset(input$fechadef,15, cal)),format="%d/%m/%Y"))
    })
    
    output$vencimiento20 <- renderText({
      paste0("Veinte días hábiles desde el ingreso: ",as.character(as.Date(offset(input$fechadef,20, cal)),format="%d/%m/%Y"))
    })
    
    output$vencimiento30 <- renderText({
      paste0("Treinta días hábiles desde el ingreso: ",as.character(as.Date(offset(input$fechadef,30, cal)),format="%d/%m/%Y"))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
