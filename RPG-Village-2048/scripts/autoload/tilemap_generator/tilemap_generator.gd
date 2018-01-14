extends EditorScript
tool

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
var M = [[null]]

# results
var tilemaps = []

var db = load("res://scripts/util/debugging_tools.gd").new()
var utils = load("res://scripts/util/utils.gd").new()

func _run():
	create_tilemaps()
	for i in range(tilemaps.size()):
		var t = tilemaps[i].duplicate()
		var n = Node2D.new()
		n.hide()
		n.set_name("LVL " + str(i))
		n
		get_scene().add_child(n)
		n.set_owner(get_scene())
		for c in t.get_children():
			var cd = c.duplicate()
			n.add_child(cd)
			cd.set_owner(get_scene())

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

########## PUT STUFF FUNCTIONS ##########

func put_stuff(layer, i):
	var tile = probability_tree.layer(2).pick_random_tile()
	var p = pick_random_pos(i, tile)
	print(p)
	print(tile.used_cells)
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2
	if p.x != -1:
		var map_position = p + offset
		update_matrix(p, tile)
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

func rebuild_layer(layer, i):
	var offset = (TILEMAP_SIZES[i].total - TILEMAP_SIZES[i].usable) / 2
	db.print_matrix(M)
	# TODO: probar de restar offsetlayer
	for i in range(M.size()):
		for j in range(M[0].size()):
			if M[i][j] != null and M[i][j].is_root:
				layer.set_cell(i + offset.x, j + offset.y, M[i][j].tile_id)

########## ALGORITHMS ##########


## MAX RECTANGLE ##

func _init_cache():
	var c = []
	for j in range(M[0].size()):
		c.append(0)
	return c

func _update_cache(i, c):
	for j in range(M[0].size()):
		if M[i][j] != null:
			c[j] = c[j] + 1
		else:
			c[j] = 0

func _grow_ones(ll, c, w, h):
	var ur = Vector2(ll.x - 1, ll.y - 1)
	var x_max = w
	var y = ll.y - 1
	while y + 1 < h and M[ll.x][y + 1] != null:
		y += 1
		x_max = min(ll.x + c[y] - 1, x_max)
		if _area(ll, Vector2(x_max, y)) > _area(ll, ur):
			ur = Vector2(x_max, y)
	return ur

func _area(ll, ur):
	if ll.x > ur.x or ll.y > ur.y:
		return 0
	return (ur.x - ll.x + 1) * (ur.y - ll.y + 1)

func get_max_rectangle():
	var w = M.size()
	var h = M[0].size()
	var c = _init_cache()
	var best_ll = Vector2(0, 0)
	var best_ur = Vector2(-1, -1)
	for i in range(w - 1, -1, -1):
		_update_cache(i, c)
		for j in range(0, h):
			var ll = Vector2(i, j)
			var ur = _grow_ones(ll, c, w, h)
			if _area(ll, ur) > _area(best_ll, best_ur):
				best_ll = ll
				best_ur = ur
	return _area(best_ll, best_ur)

########## MATRIX FUNCTIONS ##########

func update_matrix(p, tile):
	var uid = utils.get_new_id()
	var cell = BoardCell.new().setup(tile.id, uid, false)
	var root_cell = BoardCell.new().setup(tile.id, uid, true)
	for used_cell in tile.used_cells:
		var val = cell
		if used_cell == Vector2(0, 0):
			val = root_cell
		var dest = used_cell + p
		M[dest.x][dest.y] = val

func check_valid_pos(p, tile):
	for cell in tile.used_cells:
		var pos = p + cell
		if pos.x < 0 or pos.y < 0 or M[pos.x][pos.y] != null:
			return false
	return true

func pick_random_pos(i, tile):
	var w = M.size()
	var h = M[0].size()
	var s = w * h
	var r = randi() % s
	var p = Vector2(r / h, r % h)

	var first = r
	while !check_valid_pos(p, tile):
		r = (r + 1) % s
		if r == first:
			return Vector2(-1, -1)
		p = Vector2(r / h, r % h)

	return p

func _get_cuts():
	# x_cuts mean the row position in which we can insert a new empty column
	var x_cuts = [0, M.size()]
	# y_cuts mean the column position in which we can insert a new empty row
	var y_cuts = [0, M[0].size()]
	var y_availability = []
	for j in range(1, M[0].size()):
		y_availability.append(true)

	for i in range(1, M.size()):
		var can_x_cut = true
		for j in range(1, M[0].size()):
			if M[i][j] == null:
				continue
			if M[i - 1][j] != null and M[i - 1][j].unique_id == M[i][j].unique_id:
				can_x_cut = false
			if M[i][j - 1] != null and M[i][j - 1].unique_id == M[i][j].unique_id:
				y_availability[j - 1] = false
		if can_x_cut:
			x_cuts.append(i)

	for j in range(y_availability.size()):
		if y_availability[j]:
			y_cuts.append(j + 1)

	return {
		'x_cuts': x_cuts,
		'y_cuts': y_cuts
	}

func expand_matrix(phase):
	var diff = TILEMAP_SIZES[phase].usable - TILEMAP_SIZES[phase - 1].usable
	var cuts = _get_cuts()
	var r_x = randi() % cuts.x_cuts.size()
	var r_y = randi() % cuts.y_cuts.size()

	# TODO: what happens if diff.x is greater than the size of any cut array
	var selected_x_cuts = []
	for i in range(diff.x):
		var x_cut = cuts.x_cuts[(r_x + i) % cuts.x_cuts.size()]
		selected_x_cuts.append(x_cut)
	selected_x_cuts.sort()

	for i in range(selected_x_cuts.size()):
		var cut = selected_x_cuts[i]
		var col = []
		for j in range(M[0].size()):
			col.append(null)
		M.insert(cut + i, col)

	var selected_y_cuts = []
	for j in range(diff.y):
		var y_cut = cuts.y_cuts[(r_y + j) % cuts.y_cuts.size()]
		selected_y_cuts.append(y_cut)
	selected_y_cuts.sort()

	for i in range(M.size()):
		for j in range(selected_y_cuts.size()):
			var cut = selected_y_cuts[j]
			M[i].insert(cut + j, null)

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
			# print(get_max_rectangle())

		put_floor(layer0, i)
		put_stuff(layer2, i)
		tilemaps.append(get_complete_tilemap(layer0, layer1, layer2))

class BoardCell:
	var tile_id = null
	var unique_id = null
	var is_root = false

	func setup(_tile_id, _unique_id, _is_root):
		tile_id = _tile_id
		unique_id = _unique_id
		is_root = _is_root
		return self
