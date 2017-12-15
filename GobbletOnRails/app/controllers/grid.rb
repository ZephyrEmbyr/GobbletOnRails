require 'ruby2d'

 class Grid

	# helper_method :display, :move, :display2, :changeTurn, :checkWin, :validThree

	attr_accessor :turn, :pieceWhite, :pieceBlack, :grid
	def initialize #4 by 4 grid, 3 stacks of 4 pieces each.
		@grid = [[[],[],[],[]],[[],[],[],[]],[[],[],[],[]],[[],[],[],[]]]
		@pieceWhite = [["1w","2w","3w","4w"],["1w","2w","3w","4w"],["1w","2w","3w","4w"]]
		@pieceBlack = [["1b","2b","3b","4b"],["1b","2b","3b","4b"],["1b","2b","3b","4b"]]
		@turn = "White"
	end

	def display
		puts "White pieces:"
		@pieceWhite.each { |a| if a.length > 0 then print a.last[0] , "\t" else print "None" , "\t"end }
		puts "\n\n\n"
		puts "Black pieces:"
		@pieceBlack.each{ |a| if a.length > 0 then print a.last[0] , "\t" else print "None" , "\t"end }
		puts "\n\n\n"
		puts "Board:"
		@grid.each{ |a|
			print "| "
			a.each{ |b|
					if b.length == 0
						print "   | "
					else
						print b.last, " | "
					end
			}
			puts ""
		}
		puts "\n\n\n\n\n\n\n\n"
	end

	def move(input)
		success = false
		arr = input.split("x")
		if arr[0]==arr[1]
			puts "invalid move: either wrong syntax or you're moving a piece to where it already was"
		else
			if arr[0].length == 1
				#This checks whether piece being moved is valid and then returns it if valid
				from = arr[0].to_i-1
				piece = "fake"
				if @turn == "White"
					if @pieceWhite[from].length == 0
						puts "invalid move: no piece there"
					else
						piece = @pieceWhite[from].pop
					end
				else
					if @pieceBlack[from].length == 0
						puts "invalid move: no piece there"
					else
						piece = @pieceBlack[from].pop
					end
				end

				if arr[1].length == 2 && piece != "fake" && /[0123]/.match(arr[1][0])!=nil && /[0123]/.match(arr[1][1])!=nil
					row = arr[1][0].to_i
					col = arr[1][1].to_i
					if @grid[row][col].length == 0
						@grid[row][col].push(piece)
						success = true
					elsif validThree([row,col])
						if @grid[row][col].length == 0
							@grid[row][col].push(piece)
							success = true
						elsif @grid[row][col].last[0].to_i<piece[0].to_i
							@grid[row][col].push(piece)
							success = true
						else
							puts "invalid move: bigger piece in the way"
							if @turn == "White"
								@pieceWhite[from].push(piece)
							else
								@pieceBlack[from].push(piece)
							end
						end	
					else
						puts "invalid move: not an empty square"
						if @turn == "White"
							@pieceWhite[from].push(piece)
						else
							@pieceBlack[from].push(piece)
						end
					end
				elsif piece != "fake"
					puts "invalid move: not a valid moveTo"
					if @turn == "White"
						@pieceWhite[from].push(piece)
					else
						@pieceBlack[from].push(piece)
					end
				end

			elsif arr[0].length == 2
				if /[0123]/.match(arr[0][0]) && /[0123]/.match(arr[0][1])
					row = arr[0][0].to_i
					col = arr[0][1].to_i
					piece = "fake"

					if @turn == "White"
						if /[w]/.match(@grid[row][col].last)
							piece = @grid[row][col].pop
						else
							puts "invalid move: nothing there or not your piece"
						end
					else
						if /[b]/.match(@grid[row][col].last)
							piece = @grid[row][col].pop
						else
							puts "invalid move: nothing there or not your piece"
						end
					end
				else
					puts "invalid move: not a valid piece position"
				end


				if arr[1].length == 2 && piece != "fake" && /[0123]/.match(arr[1][0]) && /[0123]/.match(arr[1][1])
					row = arr[1][0].to_i
					col = arr[1][1].to_i

					if @grid[row][col].length == 0
						@grid[row][col].push(piece)
						success = true
					elsif @grid[row][col].last[0].to_i<piece[0].to_i
						@grid[row][col].push(piece)
						success = true
					else
						puts "invalid move: bigger piece in the way"
						@grid[arr[0][0].to_i][arr[0][1].to_i].push(piece)
					end	
				elsif piece != "fake"
					puts "invalid move: not a valid piece position"
					@grid[arr[0][0].to_i][arr[0][1].to_i].push(piece)
				end

			else
				puts "invalid move: not a valid piece statement"
				@grid[arr[0][0].to_i][arr[0][1].to_i].push(piece)
			end
		end

		if success
			changeTurn
		end

		return success
	end

	def changeTurn
		if @turn == "White"
			@turn = "Black"
		else
			@turn = "White"
		end
	end

	def checkWin
		diag1Count = 0
		diag2Count = 0
		for i in 0..3
			rowCount = 0
			colCount = 0

			for j in 0..3
				if /[w]/.match(@grid[i][j].last)
					rowCount = rowCount + 1
				end
				if /[w]/.match(@grid[j][i].last)
					colCount = colCount + 1
				end
			end
			if rowCount == 4 || colCount == 4
				return [true,"White"]
			end
			if /[w]/.match(@grid[i][i].last)
				diag1Count = diag1Count + 1
			end
			if /[w]/.match(@grid[i][3-i].last)
				diag2Count = diag2Count + 1
			end
		end
		if diag1Count == 4 || diag2Count == 4
			return [true,"White"]
		end

		diag1Count = 0
		diag2Count = 0
		for i in 0..3
			rowCount = 0
			colCount = 0

			for j in 0..3
				if /[b]/.match(@grid[i][j].last)
					rowCount = rowCount + 1
				end
				if /[b]/.match(@grid[j][i].last)
					colCount = colCount + 1
				end
			end
			if rowCount == 4 || colCount == 4
				return [true,"Black"]
			end
			if /[b]/.match(@grid[i][i].last)
				diag1Count = diag1Count + 1
			end
			if /[b]/.match(@grid[i][3-i].last)
				diag2Count = diag2Count + 1
			end
		end
		if diag1Count == 4 || diag2Count == 4
			return [true,"Black"]
		end

		return [false, "Kevin"]
	end



	def validThree(position)
		threeGrid = [[false,false,false,false],[false,false,false,false],[false,false,false,false],[false,false,false,false]]
		for i in 0..3
			count = 0
			for j in 0..3
				if @turn == "White"
					if /[b]/.match(@grid[i][j].last)
						count = count + 1
					end
				else
					if /[w]/.match(@grid[i][j].last)
						count = count + 1
					end
				end
			end
			if count >= 3
				for j in 0..3
					threeGrid[i][j] = true
				end
			end 
		end

		for i in 0..3
			count = 0
			for j in 0..3
				if @turn == "White"
					if /[b]/.match(@grid[j][i].last)
						count = count + 1
					end
				else
					if /[w]/.match(@grid[j][i].last)
						count = count + 1
					end
				end
			end
			if count >= 3
				for j in 0..3
					threeGrid[j][i] = true
				end
			end
		end

		count = 0
		for i in 0..3
			if @turn == "White"
				if /[b]/.match(@grid[i][i].last)
					count = count + 1
				end
			else
				if /[w]/.match(@grid[i][i].last)
					count = count + 1
				end
			end
		end
		if count >= 3
			for j in 0..3
				threeGrid[j][j] = true
			end
		end 

		count = 0
		for i in 0..3
			if @turn == "White"
				if /[b]/.match(@grid[3-i][i].last)
					count = count + 1
				end
			else
				if /[w]/.match(@grid[3-i][i].last)
					count = count + 1
				end
			end
		end
		if count >= 3
			for j in 0..3
				threeGrid[3-j][j] = true
			end
		end 

		return threeGrid[position[0]][position[1]]
	end

	def display2(grid)
		#set title: "Testing Ruby 2D"

		size = 18 				# must be even integer

		buffer = size * 1.8 	# must be divisible by 4

		# builds the game board
		boardSize = 5 * buffer + 4 * 4 * size
		board = Rectangle.new(
		  x: 0, y: 0, width: boardSize, height: boardSize,
		  color: [1, 0.4, 0.28, 0.82]
		)

		#fun color choice!
		#board.color: ['#1dff00', '#fa00ff', '#00edff', '#c7ff00']

		# draws lines on board
		boardLines = []
		(0..4).each do |i|
			boardLines.push(Rectangle.new(x: 0, y: (buffer/4) + i * buffer + 4 * size * i, width: boardSize, height: (buffer/2), z: 0, color: 'black'))
			boardLines.push(Rectangle.new(x: (buffer/4) + i * buffer + 4 * size * i, y: 0, width: (buffer/2), height: boardSize, z: 0, color: 'black'))
		end

		#border definitions
		border1 = Rectangle.new(x: 0, y: 0, width: boardSize, height: (buffer/4), z: 0, color: "black")
		border2 = Rectangle.new(x: boardSize - (buffer/4), y: 0, width: (buffer/4), height: boardSize, z: 0, color: "black")
		border3 = Rectangle.new(x: 0, y: boardSize - (buffer/4), width: boardSize, height: (buffer/4), z: 0, color: "black")
		border4 = Rectangle.new(x: 0, y: 0, width: (buffer/4), height: boardSize, z: 0, color: "black")

		# example grid
		#grid = [[["1b", "3w"],["2b"],["3b"],["4b"]],[[],["1b"],["3w"],[]],[["1w", "2b", "3w", "4w"],["4b"],[],[]],[["4w"],[],[],[]]]

		# initial variable settings
		numRows = 0
		numCols = 0
		currIndex = 0
		pieces = []

		# adds potential displayed pieces
		(1..16).each do |i|
			pieces.push(Square.new(x: 0, y: 0, size: 0, z: 0, color: 'blue'))
		end

		grid.each do |row|
			row.each do |stack|
				# if the space is empty
				if stack.empty?
					numCols += 1
					currIndex += 1
					next
				end

				# gets topmost element
				element = stack.last

				# sets color
				if element[1] == "w"
					pieces[currIndex].color = "white"
				elsif element[1] == "b"
					pieces[currIndex].color = "black"
				end

				# sets piece size
				elementSize = element[0].to_i * size
				pieces[currIndex].size = elementSize

				# sets piece coordinates
				pieces[currIndex].x = buffer * (numCols + 1) + 4 * size * numCols + ((4 - element[0].to_i) * size) / 2
				pieces[currIndex].y = buffer * (numRows + 1) + 4 * size * numRows + ((4 - element[0].to_i) * size) / 2
				numCols += 1
				currIndex += 1
			end
			numRows += 1
			numCols = 0
		end

		piece = Square.new(x: 0, y: 0, size: 0, z: 0, color: 'white')

		t = Time.now

		# update do
		#   # Close the window after 5 seconds
		#   if Time.now - t > 0.1 then close end
		# end
		# clear
		# show
		# close

		system 'build '
	end

# k = Board.new
# win = k.checkWin
# display2(k.grid)
# while win[0] == false
# 	puts "It is " + k.turn + "'s turn: "
# 	moves = gets.chomp
# 	k.move(moves)
# 	display2(k.grid)
# 	win = k.checkWin
# end

# if win[0] == true
# 		puts win[1].to_s + " won!!!"
# end

end
