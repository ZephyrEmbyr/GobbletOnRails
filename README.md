# GobbletOnRails

Created by Kevin Chen and Alex Gentle for Professor Irfan's Principles of Programming Languages class, Fall 2017.

GobbletOnRails is currently a ruby project - Gobblet is a board game that incorporates elements of tic-tac-toe and gives it a twist. Players have 3 stacks of 4 pieces in each stack of decreasing size. White and black alternate by putting pieces from these stacks onto the board, moving existing pieces on the board, or capturing a smaller piece (even of the same color) from off the board.

In its current form, GobbletOnRails is fully functional, but not online. We use Ruby2d gem to display graphics of the board and pieces, and a Ruby file to manage the entire game logic, including pieces, board, win condition, and valid moves. Turn changes, checks for whether a move is valid, and win condition are all automatic.

Players can interface with the command line through moves, written in the form "#x##" or "##x##". ## denotes a board position, x is a separation character, and # is one of the three piece stacks from off the board. The board is represented by columns labeled 0-3 from top to bottom, and rows 0-3 labeled from left to right. The piece stacks are labeled 0,1,2. 

In the Rails project, we currently have the ability to name the White and Black player, as well as save wins and losses in a database. We also have a leaderboard for the current best players (with the most wins), a rulebook page that explains how to play the game, and a home page.

This is still a work in progress - Alex and I hope to continue working on this over winter break 2017 and onward!

Check GobbletOnRails for the current rails project, Screenshots folder for example screenshots.
