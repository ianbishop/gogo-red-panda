=begin
** Form generated from reading ui file 'Main.ui'
**
** Created: Mon Mar 7 21:03:00 2011
**      by: Qt User Interface Compiler version 4.7.0
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :actionExit
    attr_reader :actionNew_Game
    attr_reader :centralwidget
    attr_reader :label
    attr_reader :menubar
    attr_reader :menuFile
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 850)
    @actionExit = Qt::Action.new(mainWindow)
    @actionExit.objectName = "actionExit"
    @actionNew_Game = Qt::Action.new(mainWindow)
    @actionNew_Game.objectName = "actionNew_Game"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @label = Qt::Label.new(@centralwidget)
    @label.objectName = "label"
    @label.geometry = Qt::Rect.new(0, 0, 800, 800)
    @label.pixmap = Qt::Pixmap.new("resources/board.png")
    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 25)
    @menuFile = Qt::Menu.new(@menubar)
    @menuFile.objectName = "menuFile"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    @menubar.addAction(@menuFile.menuAction())
    @menuFile.addAction(@actionNew_Game)
    @menuFile.addSeparator()
    @menuFile.addAction(@actionExit)

    retranslateUi(mainWindow)

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "GoGo Red Panda", nil, Qt::Application::UnicodeUTF8)
    @actionExit.text = Qt::Application.translate("MainWindow", "Exit", nil, Qt::Application::UnicodeUTF8)
    @actionNew_Game.text = Qt::Application.translate("MainWindow", "New Game", nil, Qt::Application::UnicodeUTF8)
    @label.text = ''
    @menuFile.title = Qt::Application.translate("MainWindow", "File", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
        #slots 'actionNewGame()'         
        def initialize (window)
            super
            @w = window
            setupUi(@w)
            puts 'Output'
            @w.connect(@actionNew_Game, SIGNAL("triggered()"), self, SLOT("actionNewGame()"))
        end

        def actionNewGame
            puts 'New Game'
        end
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    
    w = Qt::MainWindow.new
    u = Ui::MainWindow.new(w)
    w.show
    a.exec
end