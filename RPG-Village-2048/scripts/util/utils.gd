extends Node

func load_json(file_path):
	var d = {}
	var file = File.new()
	file.open(file_path, file.READ)
	d.parse_json(file.get_as_text())
	file.close()
	return d
