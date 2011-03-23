require '../Game.rb'

module GTProtocol
   class Response
      def initialize(buffer)
         @lines = buffer.split("\n")
         first, *rest = *@lines.first.split(" ")
         @q = first[0]
         @lines[0] = rest.join(" ")
      end
      
      def to_i
         raise @lines.first unless @q == '='
         @lines.first.to_i
      end
      
      def to_f
         raise @lines.first unless @q == '='
         @lines.first.to_f
      end
      
      def to_s
         raise @lines.first unless @q == '='
         @lines.join("\n")
      end
      
      def to_a
         raise @lines.first unless @q == '='
         if(@lines.length > 1)
            @lines
         else
            @lines.first.split(" ")
         end
      end
      
      def to_b
         return (@q == '=')
      end
   end
   
   class Wrapper
   			include Game
			include Subscriber
			
      attr_reader :open

      def create_game
		 open('/Applications/gnugo --mode gtp') unless open
		 clear_board
      end
   
      def move
         
      end
   
      def end_game
         
      end

	  def accept(message)
	  end
      
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
         while (s = @gnugo.gets) != "\n"
            buffer << s
         end
         Response.new(buffer)
      end


      def quit
         send("quit")
         @gnugo.close
         receive.to_b
      end

      def version
         send("protocol_version")
         receive.to_i
      end

      def name
         send("name")
         receive.to_s
      end

      def boardsize
         send("query_boardsize")
         receive.to_i
      end

      def boardsize=(size)
         send("boardsize #{size}")
         receive.to_b
      end

      def clear_board
         send("clear_board")
         receive.to_b
      end

      def orientation
         send("query_orientation")
         receive.to_i
      end

      def orientation=(n)
         send("orientation #{n}")
         receive.to_b
      end

      def komi=(k)
         send("komi #{k}")
         receive.to_b
      end

      def komi
         send("get_komi")
         receive.to_f
      end

      def play(colour, vertex)
         send("play #{colour} #{vertex}")
         receive.to_b
      end

      def fixed_handicap=(numStones)
         begin
            send("fixed_handicap #{numStones}")
            receive().to_a
         rescue => e
            e.to_s
         end
      end

      def fixed_handicap
         send("handicap")
         receive.to_i
      end

      def free_handicap=(numStones)
         begin
            send("place_free_handicap #{numStones}")
            receive.to_a
         rescue => e
            e.to_s
         end
      end

      def free_handicap
         send("handicap")
         receive.to_i
      end

      def load_sgf(filename, move_num=nil, vertex="")
         move_num ||= ""
         begin
            send("loadsgf #{filename} #{move_num} #{vertex}".trim())
            receive.to_s
         rescue => e
            e.to_s
         end
      end

      def is_legal?(colour, vertex)
         begin
            send("is_legal #{colour} #{vertex}")
            (receive.to_i == 1)
         rescue
            false
         end
      end

      def all_legal?(colour)
         begin
            send("all_legal #{colour}")
            receive.to_a
         rescue => e 
            e.to_s
         end
      end

      def captures(colour)
         begin
            send("captures #{colour}")
            receive.to_a
         rescue => e 
            e.to_s
         end
      end

      def last_move
         begin
            send("last_move")
            receive.to_s
         rescue => e 
            e.to_s
         end
      end

      def move_history
         send("move_history")
         receive.to_a
      end

      def clear_cache
         send("clear_cache")
         receive.to_b
      end

      def genmove(colour)
         begin
            send("genmove #{colour}")
            receive.to_s
         rescue => e 
            e.to_s
         end
      end
   
      def showboard
         send("showboard")
         receive.to_s
      end
   end
end

@w = GTProtocol::Wrapper.new
@w.create_game
