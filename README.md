# Calculadora de fechas de vencimiento

Esta es una pequeña aplicación desarrollada en R Shiny, cuyo objetivo esencial fue ayudar a mis compañeros de la Dirección General Seguimiento de Organismos y Acceso a la Información ([DGSOCAI](https://www.buenosaires.gob.ar/gobierno/institucional-subsecretaria-de-reforma-politica/dg-seguimiento-de-organismos-de-control-y-acceso-a-la-informacion)) del Gobierno de la Ciudad de Buenos Aires (GCBA).

Nuestra dirección se encargaba de procesar los pedidos de información pública hacia el GCBA, los cuales por ley tenían una determinada fecha de vencimiento, con posible derecho a prórroga. Estas fechas de vencimiento se calculaban tomando 15 y 25 días hábiles en adelante, dependiendo si era la primera fecha de vencimiento o la segunda.

El problema surgía a partir del trabajo de las personas que completaban esos formularios, para su posterior procesamento en el ministerio correspondiente que debía responder la solicitud. La aplicación que utilizaban para llenarlos no calculaba de forma automática las fechas de vencimiento, por lo que los trabajadores debían calcularlas de forma manual, contemplando días de semana y feriados para el mismo. Dada la alta carga de trabajo, esto llevaba a errores que se iban acumulando.

Yo entré en la dirección como analista de datos, y uno de los trabajos semanales asignados era detectar errores en la base de datos que agrupaba todos estos expedientes. Para detectar errores en el cálculo de fechas de vencimiento mi antecesora en el puesto utilizaba un script de R y la librería [bizdays](https://cran.r-project.org/web/packages/bizdays/readme/README.html), la cual permitía generar calendarios y así calcular períodos de tiempo que contemplasen feriados y fines de semana.

Como venía de aprender a utilizar R Shiny, me di cuenta que era posible evitar en buena medida que estos errores se multiplicaran tanto. Para eso, diseñé la calculadora de fechas de vencimiento, cuyo principal función fue arrojar las dos fechas de vencimiento del expediente que generaban en ese momento. Su utilización es muy sencilla: con ingresar la fecha de apertura del expediente, la aplicación arroja las dos fechas de vencimiento (las cuales se toman a partir de los 15 y 25 días hábiles, respectivamente).

El único limitante de esta app es que se debe actualizar constantemente la lista de feriados para cada año, la cual puede variar a medida que pasa el tiemop.

[Link a la aplicación web](https://dgsocai-104.shinyapps.io/calculo_vencimiento/?_ga=2.258113346.971990640.1634312890-1976076516.1634312890)
