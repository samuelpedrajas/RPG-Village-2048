extends EditorScript
tool

const TILES_PATH = [
	[
		"res://images/TILES/TILE/GRASS/",
		"res://images/TILES/TILE/WATER/"
	],
	[
		"res://images/TILES/TILE/ROAD/"
	],
	[
		"res://images/TILES/BUILDING/BIG/",
		"res://images/TILES/BUILDING/MEDIUM/",
		"res://images/TILES/BUILDING/SMALL/",
		"res://images/TILES/BUILDING/TOWER/",
		"res://images/TILES/LIVING/ANIMAL/",
		"res://images/TILES/LIVING/ARCHER/",
		"res://images/TILES/LIVING/HEALER/",
		"res://images/TILES/LIVING/SWMAN/",
		"res://images/TILES/MISC/ARROW/",
		"res://images/TILES/MISC/FARMING/",
		"res://images/TILES/MISC/OTHER/",
		"res://images/TILES/MISC/ROCK/",
		"res://images/TILES/MISC/WOOD/",
		"res://images/TILES/NATURE/MULTIPLE_BUSH/",
		"res://images/TILES/NATURE/PLANT/",
		"res://images/TILES/NATURE/SINGLE_BUSH/",
		"res://images/TILES/NATURE/SMALL_FOLIAGE/",
		"res://images/TILES/NATURE/TREE/TYPE0/",
		"res://images/TILES/NATURE/TREE/TYPE1/",
		"res://images/TILES/NATURE/TREE/TYPE2/",
		"res://images/TILES/NATURE/TREE/TYPE3/",
		"res://images/TILES/NATURE/TREE/TYPE4/",
		"res://images/TILES/NATURE/TREE/TYPE5/",
		"res://images/TILES/NATURE/TREE/TYPE6/",
		"res://images/TILES/NATURE/TREE/TYPE7/",
		"res://images/TILES/NATURE/TREE/TYPE8/",
		"res://images/TILES/NATURE/TREE/TYPE9/",
		"res://images/TILES/NATURE/TREE/TYPE10/"
	]
]
const GROUP_TO_IMPORT = 0

var cell_size = Vector2(151, 76)
var h_spacing = 16
var v_spacing = 512
var line_skip = 2048
var current_pos = Vector2(0, 0)

func _get_name(path, file_name):
	var name = path.replace("res://images/TILES/", "").replace("/", "-")
	return name + file_name.replace(".tex", "")

func _run():
	var path_list = TILES_PATH[GROUP_TO_IMPORT]

	for path in path_list:
		var dir = Directory.new()

		if dir.open(path) == OK:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while (file_name != ""):
				if !file_name.ends_with(".tex"):
					file_name = dir.get_next()
					continue
				_create_sprite(path, file_name)
				file_name = dir.get_next()

func _create_sprite(path, file_name):
	var s = Sprite.new()
	var t = ResourceLoader.load(path + file_name)

	s.set_texture(t)
	s.set_name(_get_name(path, file_name))
	s.set_pos(current_pos)
	s.set_offset(Vector2((cell_size.x - t.get_width()) / 2, (cell_size.y - t.get_height()) / 2))
	get_scene().add_child(s)
	s.set_owner(get_scene())
	current_pos.x += t.get_width() + h_spacing
	if current_pos.x > line_skip:
		current_pos = Vector2(0, current_pos.y + v_spacing)
