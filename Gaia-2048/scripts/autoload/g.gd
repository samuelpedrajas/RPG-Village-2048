extends Node

var score = 0

func handle_token_increased(v):
	self.score += 1

func game_over():
	var game = get_tree().get_root().get_node("game")
	print("Game over")
	self.score = 0
	game.reset_board()
