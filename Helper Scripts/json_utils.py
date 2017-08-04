from PIL import Image
from math import ceil
import os, json

TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"
CELL_SIZE = {
	"x": 151,
	"y": 76
}
DEFAULT_JSON = {
	"size": {
		"i": 1,
		"j": 1
	},
	"layer": 2,
	"unique": False
}

def _get_sprite_size(file_path):
	with Image.open(file_path) as img:
	    width, height = img.size
	    return {"x": width, "y": height}

def _write_json_file(d, file_name, directory):
	file_path = os.path.join(directory, file_name).replace(".png", ".json")
	with open(file_path, 'w') as f:
		s = json.dumps(d, indent=4, sort_keys=True)
		f.write(s)

def _create_json_file(file_name, directory):
	d = DEFAULT_JSON.copy()
	image_size = _get_sprite_size(os.path.join(directory, file_name))
	d["size"]["i"] = ceil(image_size["x"]  / CELL_SIZE["x"])
	d["size"]["j"] = ceil(image_size["y"]  / CELL_SIZE["y"])
	_write_json_file(d, file_name, directory)

def _create_default_json_files(d):
	for root, dirs, files in os.walk(d):
		for file_name in files:
			_create_json_file(file_name, root)

if __name__ == "__main__":
    _create_default_json_files(TILES_PATH)