module GTProtocol
   private
   def open(gnugo)
      @gnugo = IO.popen(gnugo, 'r+')
   end
   
   def send(s)
      return unless @gnugo
      @gnugo.puts(s)
   end
   
   def receive
      return unless @gnugo
      buffer = ""
      @gnugo.each_line { |line| buffer += line }
      
      return Response.new(buffer)
   end
   
   
   def quit
      send("quit")
   end
   
   def version
      send("protocol_version")
      return receive().to_i
   end
   
   def name
      send("name")
      return receive().to_s
   end
   
   def boardsize
      send("query_boardsize")
      return receive().to_i
   end
   
   def boardsize=(size)
      begin
         send("boardsize #{size}")
      rescue BoardSizeOutOfRange
         raise
      end
   end
   
   def clear_board
      send("clear_board")
   end
   
   def orientation
      send("query_orientation")
      return receive().to_i
   end
   
   def orientation=(n)
      begin
         send("orientation #{n}")
      rescue IncorrectArgument
         raise
      end
   end
   
   def komi=(k)
      begin
         send("komi #{k}")
      rescue IncorrectArgument
         raise
      end
   end
   
   def komi
      send("get_komi")
      return receive().to_f
   end
   
   def play(colour, vertex)
      begin
         send("play #{colour} #{vertex}")
      rescue InvalidVertex
         raise
      rescue IllegalMove
         raise
      end
   end
   
   def fixed_handicap=(numStones)
      begin
         send("fixed_handicap #{numStones}")
         return receive().to_a
      rescue IncorrectArgument
         raise
      end
   end
   
   def fixed_handicap
      send("handicap")
      return receive().to_i
   end
   
   def free_handicap=(numStones)
      begin
         send("place_free_handicap #{numStones}")
         return receive.to_a
      rescue IncorrectArgument
         raise
      end
   end
   
   def free_handicap
      send("handicap")
      return receive().to_i
   end
   
   def load_sgf(filename, move_num=nil, vertex="")
      move_num ||= ""
      begin
         send("loadsgf #{filename} #{move_num} #{vertex}".trim())
         return receive.to_s
      rescue FileNotFound
         raise
      rescue IllegalFile
         raise
      end
   end
   
   def is_legal?(colour, vertex)
      begin
         send("is_legal #{colour} #{vertex}")
         return (receive.to_i == 1)
      rescue IncorrectArgument
         raise
      end
   end
   
   def all_legal?(colour)
      begin
         send("all_legal #{colour}")
         return receive.to_a
      rescue IncorrectArgument
         raise
      end
   end
   
   def captures(colour)
      begin
         send("captures #{colour}")
         return receive.to_a
      rescue IncorrectArgument
         raise
      end
   end
   
   def last_move
      begin
         send("last_move")
         return receive.to_s
      rescue IncorrectArgument
         raise
      end
   end
   
   def move_history
      send("move_history")
      return receive.to_a
   end
   
   def clear_cache
      send("clear_cache")
   end
   
   def genmove(colour)
      begin
         send("genmove #{colour}")
         return receive.to_s
      rescue IncorrectArgument
         raise
      end
   end
end