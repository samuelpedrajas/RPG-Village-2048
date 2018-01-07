extends Node

const DEFAULT_PATH = "res://scripts/util/logs/"

func print_matrix(M):
	var s = ""
	for r in M:
		var first = true
		for c in r:
			if !first:
				s += "\t\t"
			if c != null:
				s += str(c.tile_id)
			else:
				s += '-1'
			first = false
		s += "\n"
	print(s, "\r")

func dump_dict_recursive(d, s, t):
	s += "{\n"
	t += "\t"
	for key in d.keys():
		var value = d[key]
		s += t + str(key) + ": "
		if (typeof(value) == TYPE_DICTIONARY):
			s = dump_dict_recursive(value, s, t + "\t") + t + "},\n"
		else:
			s += str(value) + ",\n"
	return s

func dump_to_file(s, path):
	var f = File.new()

	f.open(path, f.WRITE)
	f.store_string(s)
	f.close()

func dump_dict(d, fn):
	var output = dump_dict_recursive(d, "", "")
	dump_to_file(output, DEFAULT_PATH + fn + ".log")