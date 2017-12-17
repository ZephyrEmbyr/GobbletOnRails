# require 'ruby2d'
# require '#{RAILS.root}/app/models/grid.rb'

class GamePageController < ApplicationController
	# helper_method :show
	# @g = Grid.new
	# puts "does it even get here???"

	def initialize
		@g = Grid.new
		@g.display
		@stuff = @g.getDisplayString
	end

	def enterMove
		moveString = params[:enterMove]
		puts moveString, " is the movestring"
		@g.display
		@g.move(moveString)
		@stuff = @g.getDisplayString
		@g.display
		render :play
		@g.display

		@gridData = @g.stringArrays
		map = {"whitePieces" = @gridData[0], "blackPieces" = @gridData[1], "game_state" = @gridData[2], "turn" = @gridData[3]} 
		newRow = GameState.new(map)
		respond_to do |format|
			if newRow.save
				puts "Success!"
				format.html {redirect_to auction_app_url}
			else
				format.html {redirect_to "/"}	# Can create an error page
			end
		end
	end

	def play
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

