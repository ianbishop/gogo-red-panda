require 'Qt4'

class Main < Qt::MainWindow
	slots 'createGame()'

	def initialize
		super

		setWindowTitle 'GoGo Red Panda'
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

		file = menuBar().addMenu "&File"
		@newGame = file.addAction "New Game"
		file.addSeparator
		quit = file.addAction "Quit"
		menuBar().geometry = Qt::Rect.new(0, 0, 800, 25)

		connect(quit, SIGNAL("triggered()"),Qt::Application.instance, SLOT("quit()"))
		connect(@newGame, SIGNAL("triggered()"),self,SLOT("createGame()"))
	end

	def createGame
		puts "Game created"
	end
end

app = Qt::Application.new ARGV
Main.new
app.exec
