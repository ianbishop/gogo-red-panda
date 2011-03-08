require 'Qt4'

class Main < Qt::MainWindow
	slots 'createGame()'

	def initialize
		super
		@pieces = Array.new(9) {Array.new(9)}
		

		setWindowTitle 'GoGo Red Panda'
		@turn = false
		@move = 0
		init_ui
		resize 800,850
		show
	end

	def init_ui
    	@label = Qt::Label.new(self)
    	@label.objectName = "label"
    	@label.text = ''
    	@label.geometry = Qt::Rect.new(0, 25, 800, 800)
    	@label.pixmap = Qt::Pixmap.new("resources/board.png")

    	@pieces.each_with_index do |n, row|
			n.each_with_index do |p, col|
		    	@pieces[row][col] = Qt::Label.new(self)
		    	@pieces[row][col].objectName = "#{row}#{col}"
		    	@pieces[row][col].text = ''
		    	xPos = (row*86) + 50
				yPos = (col*86) + 75
		    	@pieces[row][col].geometry = Qt::Rect.new(0,0,80,80)
		    	@pieces[row][col].pixmap = Qt::Pixmap.new("")
		    	@pieces[row][col].move xPos-40,yPos-40
		    end
		end

		file = menuBar().addMenu "&File"
		@newGame = file.addAction "New Game"
		file.addSeparator
		quit = file.addAction "Quit"
		menuBar().geometry = Qt::Rect.new(0, 0, 800, 25)

		connect(quit, SIGNAL("triggered()"),Qt::Application.instance, SLOT("quit()"))
		connect(@newGame, SIGNAL("triggered()"),self,SLOT("createGame()"))
	end

	def mousePressEvent(event)
		puts "Mouse clicked #{event.pos.x}, #{event.pos.y-25}"
		determineCoOrd(event.pos)
	end

	def determineCoOrd(pos)
		x = (pos.x - 50) / 86
		y = (pos.y - 50) / 86
		#return [x,y]
		puts "#{x}#{y}"
		validateMove x,y
	end

	def validateMove(x,y)
		if (true) then #check for move validity here
			#@pieces[x][y] = Piece.new(@turn ? :black : :white, x, y, @move)
			drawPiece(x,y)
			@turn = !@turn
			@move += 1
		end
	end

	def createGame
		puts "Game created"
	end

	def drawPiece(x,y)
    	@pieces[x][y].pixmap = Qt::Pixmap.new("resources/#{@turn ? "white" : "black"}.png")
	end
end

class Piece
	attr_reader :colour
	attr_reader :x
	attr_reader :y
	attr_reader :move

	def initialize(colour,x,y,move)
		@colour = colour
		@x = x
		@y = y
		@move = move
	end
end

app = Qt::Application.new ARGV
Main.new
app.exec
