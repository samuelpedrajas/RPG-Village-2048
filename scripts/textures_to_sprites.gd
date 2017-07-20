extends EditorScript
tool

var h_spacing = 16
var v_spacing = 512
var line_skip = 2048
var current_pos = Vector2(0, 0)

func _run():
	var path_list = ["res://images/tiles/tiles/", "res://images/tiles/trees/"]

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
	s.set_name(file_name.replace(".tex", ""))
	s.set_pos(current_pos)
	get_scene().add_child(s)
	s.set_owner(get_scene())
	current_pos.x += t.get_width() + h_spacing
	if current_pos.x > line_skip:
		current_pos = Vector2(0, current_pos.y + v_spacing)
