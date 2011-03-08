require 'Qt4'

class Main < Qt::MainWindow
	slots 'createGame()'

	def initialize
		super
		@pieces = Array.new(9) {Array.new(9)}
		@blank = Qt::Pixmap.new("")
		@black = Qt::Pixmap.new("resources/black.png")
		@white = Qt::Pixmap.new("resources/white.png")

		setWindowTitle 'GoGo Red Panda'
		@turn = :black
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
		    	label = Qt::Label.new(self)
		    	label.objectName = "#{row}#{col}"
		    	label.text = ''
		    	xPos = (row*86) + 50
				yPos = (col*86) + 75
		    	label.geometry = Qt::Rect.new(0,0,80,80)
		    	label.pixmap = @blank
		    	label.move xPos-40,yPos-40
		    	@pieces[row][col] = Piece.new(label,row,col)
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

	def clear_board
		@pieces.each_with_index do |n, row|
			n.each_with_index do |p, col|
				@pieces[row][col].label.pixmap = @blank
			end
		end
	end

	def mousePressEvent(event)
		puts "Mouse clicked #{event.pos.x}, #{event.pos.y-25}"
		determineCoOrd(event.pos)
	end

	def determineCoOrd(pos)
		x = (pos.x - 50) / 86
		y = (pos.y - 50) / 86
		puts "#{x}#{y}"
		validateMove x,y
	end

	def validateMove(x,y)
		if (true) then #check for move validity here
			drawPiece(x,y)
			@turn = (@turn==:black) ? :white : :black
			@move += 1
		end
	end

	def createGame
		puts "Game created"
		clear_board
		@turn = :black
		@move = 0
	end

	def drawPiece(x,y)
		puts "#{x}#{y}"
    	@pieces[x][y].label.pixmap = @turn == :white ? @white : @black
	end
end

class Piece
	attr_reader :colour
	attr_reader :x
	attr_reader :y
	attr_reader :move
	attr_accessor :label

	def initialize(label,x,y,colour=nil,move=nil)
		@label = label
		@colour = colour
		@x = x
		@y = y
		@move = move
	end
end

app = Qt::Application.new ARGV
Main.new
app.exec
