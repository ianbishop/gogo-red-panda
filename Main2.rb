require 'Qt4'

class Main < Qt::MainWindow
	slots 'createGame()','make_move(int,int)'

	@@blank
	@@black
	@@white
	def initialize
		super
		@pieces = Array.new(9) {Array.new(9)}
		@@blank ||= Qt::Pixmap.new("")
		@@black ||= Qt::Pixmap.new("resources/black.png")
		@@white ||= Qt::Pixmap.new("resources/white.png")
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
		    	@pieces[row][col] = Piece.new(self,row,col)
				@pieces[row][col].objectName = "#{x}#{y}"
				@pieces[row][col].geometry = Qt::Rect.new(0,0,80,80)
				@pieces[row][col].pixmap = @@white
		    	xPos = (row*86) + 50
				yPos = (col*86) + 75
				@pieces[row][col].move xPos-40,yPos-40
				connect(@pieces[row][col], SIGNAL("makeMove(int,int)"),self,SLOT("make_move(int,int)"))
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
				@pieces[row][col].pixmap = @@blank
			end
		end
	end

	def make_move(x,y) 
		puts "move made #{x},#{y}"
		validateMove x,y
	end

	def validateMove(x,y)
		if (true) then #check for move validity here
			drawPiece(x,y)
			#@turn = (@turn==:black) ? :white : :black
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
    	@pieces[x][y].pixmap = @turn == :white ? @@white : @@black
	end
end

class Piece < Qt::Label
	signals 'makeMove(int,int)'
	attr_reader :colour
	attr_reader :x
	attr_reader :y
	attr_reader :turn_num

	def initialize(parent,x,y,colour=nil,turn_num=[])
		super(parent)	
		@colour = colour
		@x = x
		@y = y
		@turn_num = turn_num
	end

	def mousePressEvent(event)
		puts "Mouse clicked #{@x}, #{@y}"
		emit makeMove(@x,@y)
	end
end

app = Qt::Application.new ARGV
Main.new
app.exec
