import json
import sqlite3

DB_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/RPG-Village-2048/data/tile_info.sqlite"
BIG_JSON_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Helper Scripts/big.json"

db = sqlite3.connect(DB_PATH)
big_json = json.load(open(BIG_JSON_PATH))

query = "INSERT into tile_info values (?, ?, ?, ?)"
columns = ['layer']  # name not included here, see for lop
for name, data in big_json.items():
    values = (name,) 
    values += tuple(data[c] for c in columns)
    values += (data["offset"]["x"], data["offset"]["y"])
    c = db.cursor()
    c.execute(query, values)
    c.close()
db.commit()
