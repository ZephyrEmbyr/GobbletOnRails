require 'ruby2d'

set title: "Testing Ruby 2D"

# Rectangle.new

# Rectangle.new(x: 50, y: 50, width: 100, height: 50)

# Rectangle.new(x: 50, y: 125, width: 50, height: 125, color: 'green')

size = 10

board = Rectangle.new(
  x: 0, y: 0, width: 400, height: 400,
  color: ['#1dff00', '#fa00ff', '#00edff', '#c7ff00']
)

board.color = [1, 0.4, 0.28, 0.82]

# piece1 = Square.new(x: 50, y: 50, size: 100, z: 0, color: 'white')
# piece2 = Square.new(x: 200, y: 50, size: 100, z: 0, color: 'white')
# piece3 = Square.new(x: 350, y: 50, size: 100, z: 0, color: 'white')
# piece4 = Square.new(x: 500, y: 50, size: 100, z: 0, color: 'white')
piece = Square.new(x: 0, y: 0, size: 0, z: 0, color: 'white')



def setSize1
	piece.size = size
end

def setSize2
	piece.size = 2*size
end

def setSize3
	piece.size = 3*size
end

def setSize4
	piece.size = 4*size
end

def setWhite
	piece.color = "white"
end

def setBlack
	piece.color = "black"
end






# r.x = 168
# r.y = 100
# r.width = 250
# r.height = 75

show