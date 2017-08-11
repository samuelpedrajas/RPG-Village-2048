extends EditorScript
tool

const TILES_PATH = "res://tiles/"
const LINE_SKIP = 2048
const CELL_SIZE = Vector2(151, 76)

var current_pos = Vector2(0, 0)
var h_spacing = 16
var v_spacing = 512

var current_layer = 0
var utils = load("res://scripts/util/utils.gd").new()
var cfg = load("res://scripts/autoload/cfg.gd").new()
var db = utils.load_db(cfg.DB_PATH);

func _get_full_path(categories):
	var path = TILES_PATH

	for category in categories:
		path += category + "/"

	return path

func _get_file_name(file_path):
	var file_name = file_path.substr(0, file_path.length())

	return file_name.replace(TILES_PATH, "").replace("/", "-").replace(".tex", "")

func _recursive_import(dir_path, categories):
	var d = Directory.new()
	var name = ""

	if d.open(dir_path) != OK:
		return

	d.list_dir_begin()
	name = d.get_next()

	while name != "":
		if name in [".", ".."] or name.ends_with(".json"):
			name = d.get_next()
			continue

		if d.current_is_dir():
			var new_dir_path = _get_full_path(categories + [name])
			_recursive_import(new_dir_path, categories + [name])
		else:
			var file_path = _get_full_path(categories) + name
			_create_sprite(file_path)
		
		name = d.get_next()

func _run():
	_recursive_import(TILES_PATH, [])
	db.close()

func _get_tile_offset(name):
	var res = db.fetch_array("SELECT offset_x, offset_y FROM tile_info WHERE tile_info.name='" + name + "';")
	return {
		"x": res[0]["offset_x"],
		"y": res[0]["offset_y"]
	}

func _create_sprite(file_path):
	var name = _get_file_name(file_path)
	var offset = _get_tile_offset(name)
	var s = Sprite.new()
	var t = ResourceLoader.load(file_path)

	s.set_texture(t)
	s.set_name(name)
	s.set_pos(current_pos)
	s.set_offset(Vector2(offset.x, offset.y))
	get_scene().add_child(s)
	s.set_owner(get_scene())
	current_pos.x += t.get_width() + h_spacing
	if current_pos.x > LINE_SKIP:
		current_pos = Vector2(0, current_pos.y + v_spacing)
