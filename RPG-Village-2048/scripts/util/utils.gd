extends Node

func load_json(file_path):
	var d = {}
	var file = File.new()
	file.open(file_path, file.READ)
	d.parse_json(file.get_as_text())
	file.close()
	return d

var current_id = 0

func get_new_id():
	current_id += 1
	return current_id
