extends Node

const N_TILEMAPS = 9
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

const TILESET_PATH = "res://tilesets/token_tileset.tres"
var tileset = load(TILESET_PATH)

# probability trees
var probability_tree = load(
	"res://scripts/autoload/tilemap_generator/probability_tree.gd"
).new()

# main matrix
var M = [[-1]]

# results
var tilemaps = []

########## OUTPUT FUNCTION ##########

func get_tilemap(level):
	return tilemaps[level].duplicate()

########## INIT FUNCTIONS ##########

func init_map(layer_index, level):
	var layer = TileMap.new()
	var scale = TOKEN_SIZE.x / (CELL_SIZE.x * TILEMAP_SIZES[level].total.x)

	# set properties
	layer.set_tileset(tileset)
	layer.set_scale(Vector2(scale, scale))
	layer.set_mode(layer.MODE_ISOMETRIC)
	layer.set_cell_size(CELL_SIZE)
	layer.set_tile_origin(layer.TILE_ORIGIN_CENTER)

	return layer

########## PUT AND SELECT STUFF FUNCTIONS ##########

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

func put_stuff(layer, i):
	var p = pick_random_pos(i)
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2
	if p.x != -1:
		var map_position = p + offset
		var tile = probability_tree.layer(2).pick_random_tile()
		M[p.x][p.y] = tile.id
		layer.set_cell(map_position.x, map_position.y, tile.id)

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
			var tile = probability_tree.layer(0).get("floor-water-water")

			if center.has_point(cell_pos):
				tile = probability_tree.layer(0).get("floor-grass-grass")
			elif cell_pos == Vector2(bounds.down, bounds.left):
				tile = probability_tree.layer(0).get("floor-water-out_corner-right")
			elif cell_pos == Vector2(bounds.down, bounds.right):
				tile = probability_tree.layer(0).get("floor-water-out_corner-down")
			elif cell_pos == Vector2(bounds.up, bounds.right):
				tile = probability_tree.layer(0).get("floor-water-out_corner-left")
			elif cell_pos == Vector2(bounds.up, bounds.left):
				tile = probability_tree.layer(0).get("floor-water-out_corner-up")
			elif big_center.has_point(cell_pos): 
				if cell_pos.x == bounds.right:
					tile = probability_tree.layer(0).get("floor-water-borders-right")
				elif cell_pos.y == bounds.down:
					tile = probability_tree.layer(0).get("floor-water-borders-down")
				elif cell_pos.x == bounds.left:
					tile = probability_tree.layer(0).get("floor-water-borders-left")
				elif cell_pos.y == bounds.up:
					tile = probability_tree.layer(0).get("floor-water-borders-up")

			layer.set_cell(i, j, tile.id)

########## MATRIX FUNCTIONS ##########

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

func rebuild_layer(layer, i):
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2

	for i in range(M.size()):
		for j in range(M[0].size()):
			if M[i][j] > -1:
				layer.set_cell(i + offset.x, j + offset.y, M[i][j])

########## HELPFUL GETTER FUNCTIONS ##########

func get_complete_tilemap(l0, l1, l2):
	var tilemap = Node2D.new()

	tilemap.set_name("tilemap")
	tilemap.set_pos(Vector2(0, V_OFFSET))
	tilemap.add_child(l0)
	tilemap.add_child(l1)
	tilemap.add_child(l2)

	return tilemap

########## MAIN ##########

func create_tilemaps():
	randomize()
	probability_tree.setup(tileset)
	for i in range(0, N_TILEMAPS):
		# initialise layers
		var layer0 = init_map(0, i)
		var layer1 = init_map(1, i)
		var layer2 = init_map(2, i)

		if i != 0:
			expand_matrix(i)
			rebuild_layer(layer2, i)

		put_floor(layer0, i)
		put_stuff(layer2, i)
		tilemaps.append(get_complete_tilemap(layer0, layer1, layer2))
