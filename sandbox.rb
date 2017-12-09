class Stack
  def initialize(size)
    @size = size
    @store = Array.new(@size)
    @top = -1
  end
  
  def pop
    if empty?
      nil
    else
      popped = @store[@top]
      @store[@top] = nil
      @top = @top.pred
      popped
    end
  end
  
  def push(element)
    if full? or element.nil?
      nil
    else
      @top = @top.succ
      @store[@top] = element
      self
    end
  end
  
  def size
    @size
  end
  
  def look
    @store[@top]
  end
  
  private
  
  def full?
    @top == (@size - 1)
  end
  
  def empty?
    @top == -1
  end
end

w = Stack.new(4)

class Board
	def initialize #4 by 4 grid, 3 stacks of 4 pieces each.
		@grid = [[[],[],[],[]],[[],[],[],[]],[[],[],[],[]],[[],[],[],[]]]
		@pieceWhite = [[1,2,3,4],[1,2,3,4],[1,2,3,4]]
		@pieceBlack = [[1,2,3,4],[1,2,3,4],[1,2,3,4]]
		@turn = "White"
	end

	def display
		puts "White pieces:"
		@pieceWhite.each { |a| print a, " " }
		puts ""
		puts "Black pieces:"
		@pieceBlack.each{ |a| print a, " " }
		puts ""
		puts "Board:"
		@grid.each{ |a|
			print "| "
			a.each{ |b|
					if b.length == 0
						print "  | "
					else
						print b.last, " | "
					end
			}
			puts ""
		}
	end

	def move(input)
		arr = input.split("x")
		if arr[0].length == 1
			#This checks whether piece being moved is valid and then returns it if valid
			from = arr[0].to_i-1
			if @turn == "White"
				if @pieceWhite[from] == nil
					puts "invalid move: no piece there"
				else
					piece = @pieceWhite[from].pop
				end
			else
				if @pieceBlack[from] == nil
					puts "invalid move: no piece there"
				else
					piece = @pieceBlack[from].pop
				end
			end

			if arr[1].length == 2 && /[0123]/.match(arr[1][0]) && /[0123]/.match(arr[1][1])
				row = arr[1][0].to_i
				col = arr[1][1].to_i
				if @grid[row][col].length == 0
					@grid[row][col].push(piece)
				else
					puts "invalid move: not an empty square"
					if @turn == "White"
						@pieceWhite[from].push(piece)
					else
						@pieceBlack[from].push(piece)
					end
				end

			else
				puts "invalid move: not a valid moveTo"
				if @turn == "White"
					@pieceWhite[from].push(piece)
				else
					@pieceBlack[from].push(piece)
				end
			end

		elsif arr[0].length == 2
			if arr[1].length == 2 && /[0123]/.match(arr[1][0]) && /[0123]/.match(arr[1][1])
				row = arr[1][0].to_i
				col = arr[1][1].to_i
				
			else
				puts "invalid move: not a valid piece position"

		else
			puts "invalid move: not a valid piece statement"
		end

		changeTurn
	end

	def changeTurn
		if @turn == "White"
			@turn = "Black"
		else
			@turn = "White"
		end
	end
end

k = Board.new
k.move("1x11")
k.display