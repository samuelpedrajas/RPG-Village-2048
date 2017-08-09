import json
import os

PREFIX = "../RPG-Village-2048/"
INPUT_PATH = os.path.join(PREFIX, "tiles")
OUTPUT_FILE = "../RPG-Village-2048/scripts/autoload/tilemap_generator/tile_info.json"

def read_json_file(filepath):
	with open(filepath, "r") as f:
		d = json.loads(f.read())
		return d

def write_json_file(d, file_path):
	with open(file_path, 'w') as f:
		s = json.dumps(d, indent=4, sort_keys=True)
		f.write(s)

def get_name(file_path):
	return file_path.replace(PREFIX, "").replace("/", "-").replace(".json", "")

def main(input_path, output_path):
	big_json = read_json_file(output_path)

	for root, dirs, files in os.walk(input_path):
		for file_name in files:
			if file_name.endswith(".json"):
				file_path = os.path.join(root, file_name)
				d = read_json_file(file_path)
				big_json[get_name(file_path)] = d
	write_json_file(big_json, output_path)
	print("JSON updated. Work done.")

if __name__ == "__main__":
	main(INPUT_PATH, OUTPUT_FILE)
