library(shiny)
source("./crypto/R/add_inv.R")
source("./crypto/R/add_mod_n.R")
source("./crypto/R/mul_inv.R")
source("./crypto/R/mul_mod_n.R")
source("./crypto/R/decrypt_affine.R")
source("./crypto/R/encrypt_affine.R")
source("./crypto/R/decrypt_polyalphabetic.R")
source("./crypto/R/encrypt_polyalphabetic.R")
source("./crypto/R/matrix_mul_inv.R")
source("./crypto/R/vector_add_inv.R")


ui<-fluidPage(
	tags$head(
		tags$style(HTML("
			
			div.container-fluid {
		    	max-width: 1140px;
				padding: 0;
				font: 16px Helvetica, sans-serif;
				width: 95%;
				margin: 0 auto;
			}

			div.col-sm-12 {
				background: #66B9BF;
				color: #fff;
				text-align: center;
				padding: 5px;
			}

			div.shiny-text-output {
			    word-wrap: break-word;
			}

			textarea.shiny-bound-input {
				width: 100%;
			}

		"))
	),			
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
					"cipherText",
					"Ciphertext",
					"DGHXIKD",
					width="300px"
				)
			)
		),
		column(6,
			# outputs
			h2("Ciphertext"),
			wellPanel(
				textOutput("cipher_text_encrypt", inline=F)
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
	),
	tags$hr(),
	headerPanel("Polyalphabetic Cryptosystem"),
	
	fluidRow(
		column(6,
			# outputs
			h2("Cleartext"),
			wellPanel(
				textOutput("clearTextPoly")
			),
			# inputs
			inputPanel(
				column(6, 
					tags$h4("Matrix A"),
					tags$table(
						tags$tr(
							tags$td(numericInput("topLeft","", 3, min = 1, max = 25, width="80px")),
							tags$td(numericInput("topRight","", 5, min = 1, max = 25, width="80px"))
						),
						tags$tr(
							tags$td(numericInput("botLeft","", 1, min = 1, max = 25, width="80px")),
							tags$td(numericInput("botRight","", 2, min = 1, max = 25, width="80px"))
						)
					)
				),
				column(6,
					tags$h4("Vector b"),
					tags$table(
						tags$tr(
							tags$td(numericInput("firstEntry","", 2, min = 1, max = 25, width="80px"))
						),
						tags$tr(
							tags$td(numericInput("secondEntry","", 2, min = 1, max = 25, width="80px"))
						)
					)
				),
				#tags$hr(),
				textAreaInput(
					"cipherTextPoly",
					"Ciphertext",
					"IZAQYCLFVBQJWEIOFWZYQJECNIFYXDYDVORWQJIOJKQJ",
					width="300px"
				)
			)
		),
		column(6,
			# outputs
			h2("Ciphertext"),
			wellPanel(
				textOutput("cipherTextPoly2")
			),
			# inputs
			inputPanel(
				column(6, 
					tags$h4("Matrix A"),
					tags$table(
						tags$tr(
							tags$td(numericInput("topLeft2","", 3, min = 1, max = 25, width="80px")),
							tags$td(numericInput("topRight2","", 5, min = 1, max = 25, width="80px"))
						),
						tags$tr(
							tags$td(numericInput("botLeft2","", 1, min = 1, max = 25, width="80px")),
							tags$td(numericInput("botRight2","", 2, min = 1, max = 25, width="80px"))
						)
					)
				),
				column(6,
					tags$h4("Vector b"),
					tags$table(
						tags$tr(
							tags$td(numericInput("firstEntry2","", 2, min = 1, max = 25, width="80px"))
						),
						tags$tr(
							tags$td(numericInput("secondEntry2","", 2, min = 1, max = 25, width="80px"))
						)
					)
				),
				#tags$hr(),
				textAreaInput(
					"clearTextPoly2",
					"Cleartext",
					"MATHEMATICS IS THE QUEEN OF THE SCIENCES",
					width="300px"
				)
			)
		)
	),
	tags$hr()


)

server<-function(input, output) {

	output$clearText <- renderText({ 
	
		decrypt_affine(	
			data<-list(
				a = input$a,
				b = input$b,
				ciphertext = gsub(
					"[[:blank:]]",
					"",
					toupper(input$cipherText)
				)
			)
		)
	})

	output$cipher_text_encrypt <- renderText({ 
	
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

	output$clearTextPoly <- renderText({ 
	
		decrypt_polyalphabetic(	
			data<-list(
				A = matrix(c(input$topLeft, input$botLeft, input$topRight, input$botRight), ncol=2),
				b = c(input$firstEntry, input$secondEntry),
				ciphertext = gsub(
					"[[:blank:]]",
					"",
					toupper(input$cipherTextPoly)
				)
			)
		)
	})

	output$cipherTextPoly2 <- renderText({ 

		encrypt_polyalphabetic(	
			data<-list(
				A = matrix(c(input$topLeft2, input$botLeft2, input$topRight2, input$botRight2), ncol=2),
				b = c(input$firstEntry2, input$secondEntry2),
				cleartext = gsub(
					"[[:blank:]]",
					"",
					toupper(input$clearTextPoly2)
				)
			)
		)
	})

}

shinyApp(ui=ui, server=server)
