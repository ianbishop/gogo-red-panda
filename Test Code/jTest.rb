=begin
** Form generated from reading ui file 'test.ui'
**
** Created: Mon Mar 7 20:07:39 2011
**      by: Qt User Interface Compiler version 4.7.0
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :centralwidget
    attr_reader :pushButton
    attr_reader :pushButton_2
    attr_reader :pushButton_3
    attr_reader :layoutWidget
    attr_reader :gridLayout_2
    attr_reader :label_2
    attr_reader :spinBox_2
    attr_reader :verticalSlider_2
    attr_reader :layoutWidget_2
    attr_reader :gridLayout_3
    attr_reader :label_3
    attr_reader :spinBox_3
    attr_reader :verticalSlider_3
    attr_reader :layoutWidget_3
    attr_reader :gridLayout
    attr_reader :label
    attr_reader :spinBox
    attr_reader :verticalSlider
    attr_reader :menubar
    attr_reader :statusbar
    attr_reader :toolBar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 600)
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @pushButton = Qt::PushButton.new(@centralwidget)
    @pushButton.objectName = "pushButton"
    @pushButton.geometry = Qt::Rect.new(30, 30, 98, 27)
    @pushButton_2 = Qt::PushButton.new(@centralwidget)
    @pushButton_2.objectName = "pushButton_2"
    @pushButton_2.geometry = Qt::Rect.new(140, 110, 98, 27)
    @pushButton_3 = Qt::PushButton.new(@centralwidget)
    @pushButton_3.objectName = "pushButton_3"
    @pushButton_3.geometry = Qt::Rect.new(320, 50, 98, 27)
    @layoutWidget = Qt::Widget.new(@centralwidget)
    @layoutWidget.objectName = "layoutWidget"
    @layoutWidget.geometry = Qt::Rect.new(330, 140, 61, 148)
    @gridLayout_2 = Qt::GridLayout.new(@layoutWidget)
    @gridLayout_2.objectName = "gridLayout_2"
    @gridLayout_2.setContentsMargins(0, 0, 0, 0)
    @label_2 = Qt::Label.new(@layoutWidget)
    @label_2.objectName = "label_2"

    @gridLayout_2.addWidget(@label_2, 0, 0, 1, 1)

    @spinBox_2 = Qt::SpinBox.new(@layoutWidget)
    @spinBox_2.objectName = "spinBox_2"
    @spinBox_2.maximum = 255

    @gridLayout_2.addWidget(@spinBox_2, 1, 0, 1, 1)

    @verticalSlider_2 = Qt::Slider.new(@layoutWidget)
    @verticalSlider_2.objectName = "verticalSlider_2"
    @verticalSlider_2.maximum = 255
    @verticalSlider_2.orientation = Qt::Vertical

    @gridLayout_2.addWidget(@verticalSlider_2, 2, 0, 1, 1)

    @layoutWidget_2 = Qt::Widget.new(@centralwidget)
    @layoutWidget_2.objectName = "layoutWidget_2"
    @layoutWidget_2.geometry = Qt::Rect.new(430, 140, 61, 148)
    @gridLayout_3 = Qt::GridLayout.new(@layoutWidget_2)
    @gridLayout_3.objectName = "gridLayout_3"
    @gridLayout_3.setContentsMargins(0, 0, 0, 0)
    @label_3 = Qt::Label.new(@layoutWidget_2)
    @label_3.objectName = "label_3"

    @gridLayout_3.addWidget(@label_3, 0, 0, 1, 1)

    @spinBox_3 = Qt::SpinBox.new(@layoutWidget_2)
    @spinBox_3.objectName = "spinBox_3"
    @spinBox_3.maximum = 255

    @gridLayout_3.addWidget(@spinBox_3, 1, 0, 1, 1)

    @verticalSlider_3 = Qt::Slider.new(@layoutWidget_2)
    @verticalSlider_3.objectName = "verticalSlider_3"
    @verticalSlider_3.maximum = 255
    @verticalSlider_3.orientation = Qt::Vertical

    @gridLayout_3.addWidget(@verticalSlider_3, 2, 0, 1, 1)

    @layoutWidget_3 = Qt::Widget.new(@centralwidget)
    @layoutWidget_3.objectName = "layoutWidget_3"
    @layoutWidget_3.geometry = Qt::Rect.new(520, 140, 61, 148)
    @gridLayout = Qt::GridLayout.new(@layoutWidget_3)
    @gridLayout.objectName = "gridLayout"
    @gridLayout.setContentsMargins(0, 0, 0, 0)
    @label = Qt::Label.new(@layoutWidget_3)
    @label.objectName = "label"

    @gridLayout.addWidget(@label, 0, 0, 1, 1)

    @spinBox = Qt::SpinBox.new(@layoutWidget_3)
    @spinBox.objectName = "spinBox"
    @spinBox.maximum = 255

    @gridLayout.addWidget(@spinBox, 1, 0, 1, 1)

    @verticalSlider = Qt::Slider.new(@layoutWidget_3)
    @verticalSlider.objectName = "verticalSlider"
    @verticalSlider.maximum = 255
    @verticalSlider.orientation = Qt::Vertical

    @gridLayout.addWidget(@verticalSlider, 2, 0, 1, 1)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 25)
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar
    @toolBar = Qt::ToolBar.new(mainWindow)
    @toolBar.objectName = "toolBar"
    mainWindow.addToolBar(Qt::TopToolBarArea, @toolBar)

    retranslateUi(mainWindow)
    Qt::Object.connect(@spinBox_2, SIGNAL('valueChanged(int)'), @verticalSlider_2, SLOT('setValue(int)'))
    Qt::Object.connect(@verticalSlider_2, SIGNAL('valueChanged(int)'), @spinBox_2, SLOT('setValue(int)'))
    Qt::Object.connect(@spinBox_3, SIGNAL('valueChanged(int)'), @verticalSlider_3, SLOT('setValue(int)'))
    Qt::Object.connect(@verticalSlider_3, SIGNAL('valueChanged(int)'), @spinBox_3, SLOT('setValue(int)'))
    Qt::Object.connect(@verticalSlider, SIGNAL('valueChanged(int)'), @spinBox, SLOT('setValue(int)'))
    Qt::Object.connect(@spinBox, SIGNAL('valueChanged(int)'), @verticalSlider, SLOT('setValue(int)'))

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "Josh Test Window", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("MainWindow", "PushButton", nil, Qt::Application::UnicodeUTF8)
    @pushButton_2.text = Qt::Application.translate("MainWindow", "PushButton", nil, Qt::Application::UnicodeUTF8)
    @pushButton_3.text = Qt::Application.translate("MainWindow", "PushButton", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "GREEN", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "BLUE", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "RED", nil, Qt::Application::UnicodeUTF8)
    @toolBar.windowTitle = Qt::Application.translate("MainWindow", "toolBar", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_MainWindow.new
    w = Qt::MainWindow.new
    u.setupUi(w)
    w.show
    a.exec
end