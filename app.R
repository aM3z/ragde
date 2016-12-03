library(shiny)
source("./crypto/R/add_inv.R")
source("./crypto/R/add_mod_n.R")
source("./crypto/R/mul_inv.R")
source("./crypto/R/mul_mod_n.R")
source("./crypto/R/decrypt_affine.R")
source("./crypto/R/encrypt_affine.R")

ui<-fluidPage(
	headerPanel("Affine Cryptosystem"),
	
	fluidRow(
		column(6,
			# outputs
			h2("Cleartext"),
			wellPanel(
				textOutput("clearText")
			),
			# inputs
			inputPanel(
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
					width="300px"
				)
			)
		),
		column(6,
			# outputs
			h2("Cyphertext"),
			wellPanel(
				textOutput("cypher_text_encrypt", inline=F)
			),
			# inputs
			inputPanel(
				sliderInput(
					"a_encrypt", 
					"a value",
					min=0, max=25, value=5),
				sliderInput(
					"b_encrypt", 
					"b value",
					min=0, max=25, value=3),
				textAreaInput(
					"clear_text_encrypt",
					"Cleartext",
					"PACIFIC LUTHERAN UNIVERSITY",
					width="300px"
				)
			)
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

	output$cypher_text_encrypt <- renderText({ 
	
		encrypt_affine(	
			data<-list(
				a = input$a_encrypt,
				b = input$b_encrypt,
				cleartext = gsub(
					"[[:blank:]]",
					"",
					toupper(input$clear_text_encrypt)
				)
			)
		)

		
	 })
}

shinyApp(ui=ui, server=server)
