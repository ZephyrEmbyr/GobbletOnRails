require 'ruby2d'
# require '#{RAILS.root}/app/models/grid.rb'

class GamePageController < ApplicationController
	helper_method :show

	def show
		@temp = Grid.new
	end

	def play
		@g = Grid.new
		@g.display2(@g.grid)
	end
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

# require 'ruby2d'

