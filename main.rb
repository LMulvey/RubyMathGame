require './game'
require './player'

player1 = MathGame::Player.new
player2 = MathGame::Player.new

game = MathGame::Game.new(player1, player2)
game.run