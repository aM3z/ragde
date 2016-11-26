library(shiny)
source("./crypto/R/add_inv.R")
source("./crypto/R/add_mod_n.R")
source("./crypto/R/mul_inv.R")
source("./crypto/R/mul_mod_n.R")
source("./crypto/R/decrypt_affine.R")

ui<-fluidPage(
	headerPanel("Affine Cryptosystem"),
	# inputs
	sidebarLayout(
		sidebarPanel(
			sliderInput(
				"a", 
				"a value",
				min=0, max=25, value=5),
			sliderInput(
				"b", 
				"b value",
				min=0, max=25, value=3),
			textAreaInput(
				"cypherText",
				"Cyphertext",
				"DGHXIKD",
				width="100%",
				resize="vertical"
			)
		),
		# outputs
		mainPanel(
			h2("Cleartext"),
			textOutput("clearText")
		)
	)
)

server<-function(input, output) {
	output$clearText <- renderText({ 
	
		decrypt_affine(	
			data<-list(
				a = input$a,
				b = input$b,
				cyphertext = gsub(
					"[[:blank:]]",
					"",
					toupper(input$cypherText)
				)
			)
		)

		
	 })
}

shinyApp(ui=ui, server=server)
