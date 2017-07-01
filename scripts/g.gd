extends Node

var score = 0

func handle_token_increased(v):
	self.score += 1

func game_over():
	print("Game over")
	self.score = 0
