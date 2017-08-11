extends Node

func load_db(db_path):
	var db = SQLite.new()
	if db.open(db_path) != db.SQLITE_OK:
		print("ERR: ", db.get_errormsg());
		return;
	return db

func load_json(file_path):
	var d = {}
	var file = File.new()
	file.open(file_path, file.READ)
	d.parse_json(file.get_as_text())
	file.close()
	return d
