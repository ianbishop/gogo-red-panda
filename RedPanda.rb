require 'Qt4'
require './Board.rb'


app = Qt::Application.new ARGV
Board.new
app.exec