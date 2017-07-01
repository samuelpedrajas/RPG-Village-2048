extends Node

var score = 0
var game

func handle_token_increased(v):
	self.score += 1
	game = get_tree().get_root().get_node("game")

func game_over():
	print("Game over")
	self.score = 0
	game.reset_board()
