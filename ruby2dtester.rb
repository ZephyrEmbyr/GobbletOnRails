require 'ruby2d'

def display(grid)
	set title: "Testing Ruby 2D"

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

	show
end

#display([[["1b", "3w"],["2b"],["3b"],["4b"]],[[],["1b"],["3w"],[]],[["1w", "2b", "3w", "4w"],["4b"],[],[]],[["4w"],[],[],[]]])

