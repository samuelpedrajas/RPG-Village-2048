extends Node

const N_TILEMAPS = 9
const TILESET_PATH = "res://tilesets/token_tileset.tres"
const DEFAULT_SCALE = Vector2(0.5, 0.5)
const CELL_SIZE = Vector2(151, 76)
const V_OFFSET = 10

var tilemaps = []

func create_tilemaps():
	var tilemap = Node2D.new()
	var layer0 = TileMap.new()
	var layer1 = TileMap.new()

	tilemap.set_name("tilemap")
	tilemap.set_pos(Vector2(0, V_OFFSET))
	_init_tilemap_layer(layer0)
	_init_tilemap_layer(layer1)
	_put_grass(layer0)
	_put_trees(layer1)
	tilemap.add_child(layer0)
	tilemap.add_child(layer1)
	tilemaps.append(tilemap)

	var prev = layer1
	for i in range(1, N_TILEMAPS):
		var tm = Node2D.new()
		var l0 = layer0.duplicate()
		var l1 = prev.duplicate()

		tm.set_name("tilemap")
		tm.set_pos(Vector2(0, V_OFFSET))
		_put_trees(l1)
		tm.add_child(l0)
		tm.add_child(l1)
		tilemaps.append(tm)
		prev = l1

func _init_tilemap_layer(layer):
	var tileset = load(TILESET_PATH)
	layer.set_tileset(tileset)
	layer.set_scale(DEFAULT_SCALE)
	layer.set_mode(layer.MODE_ISOMETRIC)
	layer.set_cell_size(CELL_SIZE)
	layer.set_tile_origin(layer.TILE_ORIGIN_CENTER)

func _put_grass(layer):
	for i in range(7):
		for j in range(7):
			layer.set_cell(i, j, 13)

func _put_trees(layer):
	randomize()
	var max_pos = 6
	var r = randi() % 6
	var offset = Vector2(randi() % max_pos, randi() % max_pos)
	
	for i in range(offset.x, offset.x + max_pos):
		for j in range(offset.y, offset.y + max_pos):
			if layer.get_cell(i % max_pos , j % max_pos) < 0:
				layer.set_cell(i % max_pos, j % max_pos, 26 + r)
				return
