extends Node

const N_TILEMAPS = 9
const TILESET_PATHS = {
	0: "res://tilesets/layer0_tileset.tres",
	1: "res://tilesets/layer1_tileset.tres",
	2: "res://tilesets/layer2_tileset.tres"
}
const TILEMAP_SIZES = [
	{"total": Vector2(5, 5), "usable": Vector2(1, 1)},
	{"total": Vector2(5, 5), "usable": Vector2(3, 3)},
	{"total": Vector2(5, 5), "usable": Vector2(3, 3)},
	{"total": Vector2(5, 5), "usable": Vector2(3, 3)},
	{"total": Vector2(6, 6), "usable": Vector2(4, 4)},
	{"total": Vector2(7, 7), "usable": Vector2(5, 5)},
	{"total": Vector2(7, 7), "usable": Vector2(7, 7)},
	{"total": Vector2(8, 8), "usable": Vector2(8, 8)},
	{"total": Vector2(9, 9), "usable": Vector2(9, 9)}
]
const TOKEN_SIZE = Vector2(532, 268)
const CELL_SIZE = Vector2(151, 76)
const V_OFFSET = 10

var tilesets = {}
var name2id = {}
var tilemaps = []
var default_probabilities = {}
var probabilities = {}

func _get_initalised_map(layer_index, level):
	var tileset = tilesets[layer_index]
	var layer = TileMap.new()
	var scale = TOKEN_SIZE.x / (CELL_SIZE.x * TILEMAP_SIZES[level].total.x)

	layer.set_tileset(tileset)
	layer.set_scale(Vector2(scale, scale))
	layer.set_mode(layer.MODE_ISOMETRIC)
	layer.set_cell_size(CELL_SIZE)
	layer.set_tile_origin(layer.TILE_ORIGIN_CENTER)

	return layer

func _get_complete_tilemap(l0, l1, l2):
	var tilemap = Node2D.new()

	tilemap.set_name("tilemap")
	tilemap.set_pos(Vector2(0, V_OFFSET))
	tilemap.add_child(l0)
	tilemap.add_child(l1)
	tilemap.add_child(l2)

	return tilemap

func _init_name2id():
	for tileset in tilesets.values():
		for tile_id in tileset.get_tiles_ids():
			name2id[tileset.tile_get_name(tile_id)] = tile_id

func _load_tilesets():
	for key in TILESET_PATHS:
		tilesets[key] = load(TILESET_PATHS[key])

func _build_tree(d, tile_name, tile_id):
	var c = tile_name[0]

	if tile_name.size() == 1:
		d[c] = {}
		d[c]["p"] = 0
		d[c]["id"] = tile_id
	else:
		tile_name.remove(0)
		if !d.has(c):
			d[c] = {
				"p": 0,
				"d": {}
			}
		_build_tree(d[c].d, tile_name, tile_id)

func _init_probabilities():
	for i in range(3):
		var tileset = tilesets[i]
		var tiles = []
		default_probabilities[i] = {}

		for tile_id in tileset.get_tiles_ids():
			var tile_name = tileset.tile_get_name(tile_id)
			_build_tree(default_probabilities[i], tile_name.split("-"), tile_id)
	print(default_probabilities)

func create_tilemaps():
	_load_tilesets()
	_init_probabilities()
	_init_name2id()
	for i in range(0, N_TILEMAPS):
		var layer0 = _get_initalised_map(0, i)
		var layer1 = _get_initalised_map(1, i)
		var layer2 = _get_initalised_map(2, i)

		_put_floor(layer0, i)
		tilemaps.append(_get_complete_tilemap(layer0, layer1, layer2))

func _put_floor(layer, level):
	var total_size = TILEMAP_SIZES[level].total
	var usable_size = TILEMAP_SIZES[level].usable
	var upper_left_corner = total_size / 2 - usable_size / 2 - Vector2(1, 1)
	var lower_right_corner = upper_left_corner + usable_size + Vector2(1, 1)
	var center = Rect2(upper_left_corner + Vector2(1, 1), usable_size)
	var big_center = Rect2(upper_left_corner, usable_size + Vector2(2, 2))
	var bounds = {
		"up": upper_left_corner.x,
		"left": upper_left_corner.y,
		"down": lower_right_corner.x,
		"right": lower_right_corner.y
	}

	for i in range(total_size.x):
		for j in range(total_size.y):
			var cell_pos = Vector2(i, j)
			var tile = name2id["TILE-WATER-13"]

			if center.has_point(cell_pos):
				tile = name2id["TILE-GRASS-1"]
			elif cell_pos == Vector2(bounds.down, bounds.left):
				tile = name2id["TILE-WATER-9"]
			elif cell_pos == Vector2(bounds.down, bounds.right):
				tile = name2id["TILE-WATER-10"]
			elif cell_pos == Vector2(bounds.up, bounds.right):
				tile = name2id["TILE-WATER-11"]
			elif cell_pos == Vector2(bounds.up, bounds.left):
				tile = name2id["TILE-WATER-12"]
			elif big_center.has_point(cell_pos): 
				if cell_pos.x == bounds.right:
					tile = name2id["TILE-WATER-1"]
				elif cell_pos.y == bounds.down:
					tile = name2id["TILE-WATER-2"]
				elif cell_pos.x == bounds.left:
					tile = name2id["TILE-WATER-3"]
				elif cell_pos.y == bounds.up:
					tile = name2id["TILE-WATER-4"]

			layer.set_cell(i, j, tile)

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

func get_tilemap(level):
	return tilemaps[level].duplicate()
