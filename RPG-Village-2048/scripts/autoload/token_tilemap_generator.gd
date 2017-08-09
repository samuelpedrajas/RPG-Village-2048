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
var realistic_probabilities = {}

var M = [[-1]]

var db = load("res://scripts/util/debugging_tools.gd").new()

func get_initalised_map(layer_index, level):
	var tileset = tilesets[layer_index]  # get proper tileset
	var layer = TileMap.new()
	var scale = TOKEN_SIZE.x / (CELL_SIZE.x * TILEMAP_SIZES[level].total.x)

	# set properties
	layer.set_tileset(tileset)
	layer.set_scale(Vector2(scale, scale))
	layer.set_mode(layer.MODE_ISOMETRIC)
	layer.set_cell_size(CELL_SIZE)
	layer.set_tile_origin(layer.TILE_ORIGIN_CENTER)

	return layer

func get_complete_tilemap(l0, l1, l2):
	var tilemap = Node2D.new()

	tilemap.set_name("tilemap")
	tilemap.set_pos(Vector2(0, V_OFFSET))
	tilemap.add_child(l0)
	tilemap.add_child(l1)
	tilemap.add_child(l2)

	return tilemap

func init_name2id():
	for tileset in tilesets.values():
		for tile_id in tileset.get_tiles_ids():
			name2id[tileset.tile_get_name(tile_id)] = tile_id

func load_tilesets():
	for key in TILESET_PATHS:
		tilesets[key] = load(TILESET_PATHS[key])

func get_tile_dimensions(tile_id, tileset):
	var t = tileset.tile_get_texture(tile_id)

	return Vector2(ceil(t.get_width()  / CELL_SIZE.x), ceil(t.get_height() / CELL_SIZE.y))

func even_spread(t):
	var keys = t.keys()
	var p = (1.0 / keys.size()) * 100

	for key in keys:
		var c = t[key]
		c.p = p
		if "d" in c.keys():
			even_spread(c.d)

func build_tree(d, tile_name, tileset, tile_id):
	var c = tile_name[0]

	if tile_name.size() == 1:
		d[c] = {}
		d[c]["p"] = 0
		d[c]["id"] = tile_id
		d[c]["size"] = get_tile_dimensions(tile_id, tileset)
	else:
		tile_name.remove(0)
		if !d.has(c):
			d[c] = {
				"p": 0,
				"d": {}
			}
		build_tree(d[c].d, tile_name, tileset, tile_id)

func init_probabilities():
	for i in range(3):
		var tileset = tilesets[i]
		var tiles = []
		default_probabilities[i] = {}

		for tile_id in tileset.get_tiles_ids():
			var tile_name = tileset.tile_get_name(tile_id)
			build_tree(default_probabilities[i], tile_name.split("-"), tileset, tile_id)

		even_spread(default_probabilities[i])

func pick_random_tile(t):
	var acc = 0.0
	var r = randi() % 100

	for key in t.keys():
		var c = t[key]
		var p = c.p
		acc += p

		if acc < r:
			continue

		if "d" in c.keys():
			return pick_random_tile(c.d)
		return c

func pick_random_pos(i):
	var w = M.size()
	var h = M[0].size()
	var s = w * h
	var r = randi() % s
	var p = Vector2(r / h, r % h)

	var first = r
	while M[p.x][p.y] != -1:
		r = (r + 1) % s
		if r == first:
			return Vector2(-1, -1)
		p = Vector2(r / h, r % h)

	return p

func _add_row(m, s):
	var rn = randi() % int(s.x)
	var r = []
	for _ in range(s.y):
		r.append(-1)
	M.insert(rn, r)

func _add_col(m, s):
	var rn = randi() % int(s.y)
	for r in M:
		r.insert(rn, -1)

func expand_matrix(i):
	var diff = TILEMAP_SIZES[i].usable - TILEMAP_SIZES[i - 1].usable

	for r in range(diff.x):
		_add_row(M, TILEMAP_SIZES[i - 1].usable)
	for c in range(diff.y):
		_add_col(M, TILEMAP_SIZES[i - 1].usable)

func put_stuff(layer, i):
	var p = pick_random_pos(i)
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2
	if p.x != -1:
		var map_position = p + offset
		var tile = pick_random_tile(default_probabilities[2])
		M[p.x][p.y] = tile.id
		layer.set_cell(map_position.x, map_position.y, tile.id)

func rebuild_layer(layer, i):
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2

	for i in range(M.size()):
		for j in range(M[0].size()):
			if M[i][j] > -1:
				layer.set_cell(i + offset.x, j + offset.y, M[i][j])

func create_tilemaps():
	randomize()
	load_tilesets()  # load tilesets in tilesets global
	init_probabilities()  # init probability tree
	init_name2id()  # make a structure to translate from name to id
	for i in range(0, N_TILEMAPS):
		# initialise layers
		var layer0 = get_initalised_map(0, i)
		var layer1 = get_initalised_map(1, i)
		var layer2 = get_initalised_map(2, i)

		if i != 0:
			expand_matrix(i)
			rebuild_layer(layer2, i)

		put_floor(layer0, i)
		put_stuff(layer2, i)
		tilemaps.append(get_complete_tilemap(layer0, layer1, layer2))

func put_floor(layer, level):
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
			var tile = name2id["floor-water-water"]

			if center.has_point(cell_pos):
				tile = name2id["floor-grass-grass"]
			elif cell_pos == Vector2(bounds.down, bounds.left):
				tile = name2id["floor-water-out_corner-right"]
			elif cell_pos == Vector2(bounds.down, bounds.right):
				tile = name2id["floor-water-out_corner-down"]
			elif cell_pos == Vector2(bounds.up, bounds.right):
				tile = name2id["floor-water-out_corner-left"]
			elif cell_pos == Vector2(bounds.up, bounds.left):
				tile = name2id["floor-water-out_corner-up"]
			elif big_center.has_point(cell_pos): 
				if cell_pos.x == bounds.right:
					tile = name2id["floor-water-borders-right"]
				elif cell_pos.y == bounds.down:
					tile = name2id["floor-water-borders-down"]
				elif cell_pos.x == bounds.left:
					tile = name2id["floor-water-borders-left"]
				elif cell_pos.y == bounds.up:
					tile = name2id["floor-water-borders-up"]

			layer.set_cell(i, j, tile)

func put_trees(layer):
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
