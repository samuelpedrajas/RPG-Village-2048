extends Node

const N_LAYERS = 3

var layers = []

var big_json = {};

var utils = load("res://scripts/util/utils.gd").new()

func _init_big_json():
	var d1 = utils.load_json("res://data/tile_info_part1.json")
	var d2 = utils.load_json("res://data/tile_info_part2.json")

	big_json = d1
	for name in d2.keys():
		var value = d2[name]
		big_json[name] = value

func layer(i):
	return layers[i]

func setup(tileset):
	_init_big_json()
	for i in range(N_LAYERS):
		var root = CategoryNode.new().setup("root")
		layers.append(root)

	# for each tile, get its categories and dig across the tree
	for tile_id in tileset.get_tiles_ids():
		var tile_name = tileset.tile_get_name(tile_id)
		var tile_info = big_json[tile_name]
		var tile_node = TileNode.new().setup(tile_id, tile_name, big_json)
		layers[int(tile_info.layer)].insert(tile_node)

	for root in layers:
		# even probability distribution in every level
		root.even_spread()

	return self

class TreeNode:
	var name = ""
	var p = 0.0

	func setup(_name):
		name = _name
		return self

class CategoryNode extends TreeNode:
	var children = {}
	var _class = load("res://scripts/autoload/tilemap_generator/probability_tree.gd").CategoryNode
	func even_spread():
		var children_names = children.keys()
		var p = (1.0 / children_names.size()) * 100.0

		for name in children_names:
			var c = children[name]
			c.p = p
			if c extends _class:
				c.even_spread()

	func _insert_aux(tile_node, categories, depth):
		var c = categories[depth]

		if depth == categories.size() - 1:
			children[c] = tile_node
		else:
			if !children.has(c):
				var cat_node = _class.new().setup(c)
				children[c] = cat_node
			children[c]._insert_aux(tile_node, categories, depth + 1)

	func insert(tile_node):
		var categories = tile_node.name.split("-")
		_insert_aux(tile_node, categories, 0)

	func _get_aux(categories, depth):
		if depth == categories.size():
			return self
		else:
			var c = categories[depth]
			if children.has(c):
				return children[c]._get_aux(categories, depth + 1)

		return null

	func get(tile_name):
		var categories = tile_name.split("-")
		return _get_aux(categories, 0)

	func pick_random_tile():
		var acc = 0.0
		var r = randi() % 100

		for child_name in children.keys():
			var c = children[child_name]
			var p = c.p
			acc += p

			if acc < r:
				continue

			if c extends _class:
				return c.pick_random_tile()
			return c

		return null

class TileNode extends TreeNode:
	var id = null
	var used_cells = []

	func setup(_id, _name, big_json):
		.setup(_name)
		var tile_info = big_json[_name]
		id = _id
		for cell in tile_info.used_cells:
			used_cells.append(Vector2(cell.x, cell.y))
		return self

	func _get_aux(categories, _):
		if name.split("-") == categories:
			return self
		return null
