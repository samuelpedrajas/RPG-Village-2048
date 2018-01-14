extends Node

var score = 0
var game

func _ready():
	game = get_tree().get_root().get_node("game")

func handle_token_increased(v):
	self.score += 1

func game_over():
	print("Game over")
	self.score = 0
	game.reset_board()

func get_tilemap(i):
	var tilemap = game.tilemap_lab.get_children()[i].duplicate()
	tilemap.set_name("tilemap")
	return tilemap
