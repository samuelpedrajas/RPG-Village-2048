import pygame
import os
import shutil
import sys
import math
import json
from collections import namedtuple

PREVIOUS = -2
RESET = -1
CONTINUE = 2
OK = 1
QUIT = 0

class Point():
	def __init__(self, x, y):
		self.x = float(x)
		self.y = float(y)
		self.x_int = int(x)
		self.y_int = int(y)

	def get_tuple(self):
		return (self.x, self.y)

	def get_tuple_int(self):
		return (self.x_int, self.y_int)

	def to_iso(self):
		x = (self.x - self.y) * CELL_SIZE.x / 2.0
		y = (self.y + self.x) * CELL_SIZE.y / 2.0
		return (IMAGE_SIZE.x / 2.0 + x, y)

	def __eq__(self, other):
	    """Override the default Equals behavior"""
	    if isinstance(other, self.__class__):
	        return self.__dict__ == other.__dict__
	    return False

TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"
CELL_SIZE = Point(151, 76)
BOARD_SIZE = Point(5, 5)
IMAGE_SIZE = Point(BOARD_SIZE.x*CELL_SIZE.x, BOARD_SIZE.y*CELL_SIZE.y)
WHITE = (255,255,255,150)
RED = (255,0,0,220)
BLUE = (0,0,255,220)
BLACK = (0, 0, 0, 255)
GRAY = (200,200,200,150)
PINK = (255,80,80,255)

BACKUP_EXTENSION = ".backup"

REMOVE_PREVIOUS_LINE = '\x1b[1A' + '\x1b[2K'
line_count = 0

def _paint_cell(surface, p, color):
	i = p.x; j = p.y
	p1 = Point(i+1.0, j+1.0).to_iso()
	p2 = Point(i+1.0, j).to_iso()
	p3 = Point(i, j).to_iso()
	p4 = Point(i, j+1.0).to_iso()
	pygame.draw.polygon(surface, color, [p1, p2, p3, p4])

def _draw_base(surface, state):
	surface.fill(GRAY)
	center = Point((BOARD_SIZE.x-1)/2, (BOARD_SIZE.y-1)/2)
	sel_mode = state["sel_mode"]
	for i in range(BOARD_SIZE.x_int):
		for j in range(BOARD_SIZE.y_int):
			p = Point(i, j)
			if p == state["cursor"] and sel_mode:
				_paint_cell(surface, p, PINK)
			elif p in state["out"]["used_cells"] and sel_mode:
				_paint_cell(surface, p, RED)
			elif p == center:
				_paint_cell(surface, p, BLUE)
			elif (i % 2 == 0 or j % 2 != 0) and (i % 2 != 0 or j % 2 == 0):
				_paint_cell(surface, p, BLACK)

class Sprite(object):  # represents the sprite, not the game
	def __init__(self, _path, state):
		""" The constructor of the class """
		self.image = pygame.image.load(_path)
		self.image.fill((255, 255, 255, 200),
						None, pygame.BLEND_RGBA_MULT)
		# to get the center
		self.w, self.h = self.image.get_rect().size
		self.last_w, self.last_h = (self.w, self.h)
		# the sprite's position
		self.x = IMAGE_SIZE.x / 2.0 - self.w / 2.0
		self.y = IMAGE_SIZE.y / 2.0 - self.h / 2.0
		self.offset_x = state["out"]["offset"]["x"]
		self.offset_y = state["out"]["offset"]["y"]
		self.scale = 1.0

	def _change_offset(self, key):
		dist = 1 # distance moved in 1 frame, try changing it to 5
		if key[pygame.K_DOWN]: # down key
			self.offset_y += dist # move down
		elif key[pygame.K_UP]: # up key
			self.offset_y -= dist # move up
		if key[pygame.K_RIGHT]: # right key
			self.offset_x += dist # move right
		elif key[pygame.K_LEFT]: # left key
			self.offset_x -= dist # move left
		return {"x": self.offset_x, "y": self.offset_y}

	def _change_scale(self, key):
		change = 0.01 # distance moved in 1 frame, try changing it to 5
		if key[pygame.K_DOWN]: # down key
			self.scale -= change # move down
		elif key[pygame.K_UP]: # up key
			self.scale += change # move up
		self.scale = min(1.0, self.scale)
		self.scale = max(0.0, self.scale)

	def _print_status(self, current_line):
		offset_x_str = str(self.offset_x)
		offset_y_str = str(self.offset_y)
		offset = "(" + offset_x_str + ", " + offset_y_str + ")"
		_print_message("Offset:", offset, cursor=current_line)
		size_x_str = str(int(self.w * self.scale))
		size_y_str = str(int(self.h * self.scale))
		size = "(" + size_x_str + ", " + size_y_str + ")"
		_print_message("Size  :", size, cursor=current_line+1)

	def handle_keys(self, state):
		""" Handles Keys """
		key = pygame.key.get_pressed()

		if key[pygame.K_LCTRL]:
			self._change_scale(key)
		else:
			state["out"]["offset"] = self._change_offset(key)
		self._print_status(state["line_count"])

	def draw(self, surface):
		""" Draw on surface """
		# blit yourself at your current position
		w = int(self.w * self.scale)
		h = int(self.h * self.scale)
		# recalculate the center
		self.x += (self.last_w / 2.0) - (w / 2.0)
		self.y += (self.last_h / 2.0) - (h / 2.0)
		self.last_w, self.last_h = (w, h)
		surface.blit(pygame.transform.scale(self.image, (w, h)),
					 (self.x + self.offset_x, self.y + self.offset_y))

	def get_offset(self):
		return self.offset_x, self.offset_y

	def get_scale(self):
		return self.scale

def _handle_flow(state):
	# handle every event since the last frame.
	state["status"] = OK
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			state["status"] = QUIT
		elif event.type == pygame.KEYUP:
			if event.key == pygame.K_q:
				state["status"] = QUIT
			elif event.key == pygame.K_r:
				state["status"] = RESET
			elif event.key == pygame.K_BACKSPACE:
				if state["sel_mode"]:
					state["sel_mode"] = False
				else:
					state["status"] = PREVIOUS
			elif event.key == pygame.K_RETURN:
				if not state["sel_mode"]:
					state["sel_mode"] = True
					_print_message("Cell selection mode ON")
				else:
					state["status"] = CONTINUE
			if state["sel_mode"]:
				cursor = state["cursor"]
				if event.key == pygame.K_SPACE: # down key
					if cursor in state["out"]["used_cells"]:
						state["out"]["used_cells"].remove(cursor)
					else:
						state["out"]["used_cells"].append(cursor)
				elif event.key == pygame.K_DOWN: # down key
					cursor = Point(cursor.x, cursor.y+1)
				elif event.key == pygame.K_UP: # up key
					cursor = Point(cursor.x, cursor.y-1)
				elif event.key == pygame.K_RIGHT: # right key
					cursor = Point(cursor.x+1, cursor.y)
				elif event.key == pygame.K_LEFT: # left key
					cursor = Point(cursor.x-1, cursor.y)
				elif event.key == pygame.K_0: # down key
					state["out"]["layer"] = 0
				elif event.key == pygame.K_1: # up key
					state["out"]["layer"] = 1
				elif event.key == pygame.K_2: # right key
					state["out"]["layer"] = 2
				layer = str(state["out"]["layer"])
				_print_message("Select layer (" + layer + ")",
							   cursor=state["line_count"]+3)
				state["cursor"] = cursor

def _get_default_out():
	center = Point((BOARD_SIZE.x-1)/2,
				   (BOARD_SIZE.y-1)/2)
	out = {
		"used_cells": [{"x": center.x, "y": center.y}],
		"offset": {
			"x": 0,
			"y": 0
		},
		"layer": 2,
	}
	return out

def _get_state(file_name, root):
	cfg = _get_json_data(file_name, root)
	out = _get_default_out()
	out = {**out, **cfg}
	cells = []
	for cell in out["used_cells"]:
		cells.append((cell["x"], cell["y"]))
	out["used_cells"] = cells
	return {
		"sel_mode": False,
		"out": out,
		"cursor": Point((BOARD_SIZE.x-1)/2, (BOARD_SIZE.y-1)/2),
		"status": OK,
		"line_count": 0
	}

def _get_json_data(file_name, directory):
	file_path = os.path.join(directory, file_name).replace(".png", ".json")
	if os.path.exists(file_path):
		with open(file_path) as json_file:
		    json_data = json.load(json_file)
		    return json_data
	return {}

def _write_json_file(file_name, directory, d):
	file_path = os.path.join(directory, file_name).replace(".png", ".json")
	with open(file_path, 'w') as f:
		s = json.dumps(d, indent=4, sort_keys=True)
		f.write(s)

def _write_changes(file_name, root, out):
	cells = []
	for p in out["used_cells"]:
		d = {
			"x": p[0],
			"y": p[1]
		}
		cells.append(d)
	out["used_cells"] = cells
	_write_json_file(file_name, root, out)

def _main_loop(file_name, directory, state):
	file_path = os.path.join(directory, file_name)
	screen = pygame.display.set_mode(IMAGE_SIZE.get_tuple_int())

	sprite = Sprite(file_path, state) # create an instance
	clock = pygame.time.Clock()

	while True:
		_handle_flow(state)
		_draw_base(screen, state)

		# Handle state
		if state["status"] != OK:
			return state
		elif not state["sel_mode"]:
			sprite.handle_keys(state)

		# Display section
		sprite.draw(screen) # draw the sprite to the screen
		pygame.display.update() # update the screen
		clock.tick(40)

def _remove_backups(file_paths):
	for (file_name, root, _) in file_paths:
		json_backup = file_name.replace(".png", ".json") + BACKUP_EXTENSION
		png_backup = file_name + BACKUP_EXTENSION

		json_backup_path = os.path.join(root, json_backup)
		png_backup_path = os.path.join(root, png_backup)

		if os.path.exists(json_backup_path):
			os.remove(json_backup_path)
			_print_message(json_backup, "removed")
		if os.path.exists(png_backup_path):
			os.remove(png_backup_path)
			_print_message(png_backup, "removed")

def _restore_backup(file_name, root):
	file_path = os.path.join(root, file_name)
	shutil.copyfile(file_path + BACKUP_EXTENSION, file_path)

	# backup json if exists
	json_file = file_name.replace(".png", ".json")
	json_file_path = os.path.join(root, json_file)
	if os.path.exists(json_file_path + BACKUP_EXTENSION):
		shutil.copyfile(json_file_path + BACKUP_EXTENSION, json_file_path)
	else:
		out = _get_default_out()
		_write_json_file(file_name, root, out)

def _backup(file_name, root):
	file_path = os.path.join(root, file_name)
	shutil.copyfile(file_path, file_path + BACKUP_EXTENSION)
	_print_message(file_name, "backed up")

	# backup json if exists
	json_file = file_name.replace(".png", ".json")
	json_file_path = os.path.join(root, json_file)
	if os.path.exists(json_file_path):
		shutil.copyfile(json_file_path, json_file_path + BACKUP_EXTENSION)
		_print_message(json_file, "backed up")

def _print_message(*message, cursor=None):
	global line_count
	if cursor is None:
		cursor = line_count
	sys.stdout.write((line_count - cursor) * REMOVE_PREVIOUS_LINE)
	print(*message)
	line_count = cursor + 1

def _get_file_paths(d):
	file_paths = []
	for root, dirs, files in os.walk(d):
		for file_name in files:
			if file_name.endswith(".png"):
				file_paths.append([file_name, root, False])

	file_paths.sort(key=lambda t: t[1])
	return file_paths

def _main(d):
	file_paths = _get_file_paths(d)

	i = 0
	pygame.init()
	while i < len(file_paths):
		_print_message("Image", i, "of", len(file_paths), cursor=0)
		[file_name, root, backed_up] = file_paths[i]
		if not backed_up:
			_backup(file_name, root)
			file_paths[i][2] = True # avoid backing up again

		state = _get_state(file_name, root)
		state = _main_loop(file_name, root, state)
		status = state["status"]
		if status == CONTINUE:
			_write_changes(file_name, root, state["out"])
			i += 1
		elif status == RESET:
			_restore_backup(file_name, root)
		elif status == PREVIOUS:
			if i == 0:
				_restore_backup(file_name, root)
			else:
				i -= 1
		elif status == QUIT:
			pygame.quit() # quit the screen
			_print_message("Exiting...")
			break
	_remove_backups(file_paths)

if __name__ == "__main__":
    _main(TILES_PATH)
