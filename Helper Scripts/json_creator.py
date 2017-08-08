import pygame
import os
import shutil
import sys
import json

PREVIOUS = -2
RESET = -1
SEL_MODE = 3
CONTINUE = 2
EDIT_MODE = 1
QUIT = 0

WHITE = (255,255,255,150)
RED = (255,0,0,220)
BLUE = (0,0,255,220)
BLACK = (0, 0, 0, 255)
GRAY = (200,200,200,150)
PINK = (255,80,80,255)

REMOVE_PREVIOUS_LINE = '\x1b[1A' + '\x1b[2K'

EDIT_KEYS = {
	"mod": pygame.K_LCTRL,
	"up": pygame.K_UP,
	"down": pygame.K_DOWN,
	"left": pygame.K_LEFT,
	"right": pygame.K_RIGHT
}
TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"

REFERENCE_KEYS = {
	"mod": pygame.K_LCTRL,
	"up": pygame.K_w,
	"down": pygame.K_s,
	"left": pygame.K_a,
	"right": pygame.K_d
}
REFERENCE_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/human/characters/archer/defending.png"


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

	def to_iso(self, cell_size, image_size):
		x = (self.x - self.y) * cell_size.x / 2.0
		y = (self.y + self.x) * cell_size.y / 2.0
		return (image_size.x / 2.0 + x, y)

	def to_dict(self):
		return {
			"x": self.x,
			"y": self.y
		}

	def __eq__(self, other):
		if isinstance(other, self.__class__):
			return self.__dict__ == other.__dict__
		return False

	def __mul__(self, other):
		if isinstance(other, self.__class__):
			return Point(self.x * other.x, self.y * other.y)
		return Point(other * self.x, other * self.y)

	def __truediv__(self, other):
		return Point(self.x / other, self.y / other)

	def __add__(self, other):
		return Point(self.x + other.x, self.y + other.y)

	def __sub__(self, other):
		return Point(self.x - other.x, self.y - other.y)

	_rmul_ = __mul__

	__floordiv__ = __truediv__


class Sprite():
	def __init__(self, image_path, keys, pos):
		self.original_image = pygame.image.load(image_path)
		self.image = pygame.image.load(image_path)
		self.image.fill((255, 255, 255, 200),
						None, pygame.BLEND_RGBA_MULT)
		self.size = Point(*self.image.get_rect().size)
		self.current_size = self.size
		self.pos = pos
		self.offset = Point(0, 0)
		self.scale = 1.0
		self._set_keys(keys)

	def _set_keys(self, keys):
		self.modifier_key = keys["mod"]
		self.up_key = keys["up"]
		self.down_key = keys["down"]
		self.left_key = keys["left"]
		self.right_key = keys["right"]

	def _change_offset(self, key):
		dist = 1 # distance moved in 1 frame, try changing it to 5
		if key[self.down_key]: # down key
			self.offset.y += dist # move down
		elif key[self.up_key]: # up key
			self.offset.y -= dist # move up
		if key[self.right_key]: # right key
			self.offset.x += dist # move right
		elif key[self.left_key]: # left key
			self.offset.x -= dist # move left

	def _recenter(self):
		new_size = self.size * self.scale
		self.pos += self.current_size / 2.0 - new_size / 2.0
		self.current_size = new_size

	def _change_scale(self, key):
		step = 0.01 # distance moved in 1 frame, try changing it to 5
		if key[self.down_key]: # down key
			self.scale -= step # move down
		elif key[self.up_key]: # up key
			self.scale += step # move up
		self.scale = min(1.0, self.scale)
		self.scale = max(0.0, self.scale)
		self._recenter()

	def print_status(self):
		offset_str = str(self.offset.get_tuple())
		print_message("Offset:", offset_str, cursor=1)
		size_str = str(self.size.get_tuple())
		print_message("Size  :", size_str, cursor=2)

	def handle_edit_actions(self):
		key = pygame.key.get_pressed()

		if key[self.modifier_key]:
			self._change_scale(key)
		else:
			self._change_offset(key)

	def draw(self, surface):
		""" Draw on surface """
		current_size_t = self.current_size.get_tuple_int()
		pos_t = (self.pos + self.offset).get_tuple()
		surface.blit(
			pygame.transform.scale(self.image, current_size_t),
			pos_t
		)
		pygame.transform.scale(self.image, current_size_t)


class Image(Sprite):
	def __init__(self, image_name, directory, keys):
		self.image_path = os.path.join(directory, image_name)
		screen_centre = get_central_cell() * CELL_SIZE  # default pos
		Sprite.__init__(self, self.image_path, keys, screen_centre)
		self.json_path = self.image_path.replace(".png", ".json")
		self.image_backup_path = self.image_path + BACKUP_EXTENSION
		self.json_backup_path = self.json_path + BACKUP_EXTENSION
		self.cursor = get_central_cell()
		self.used_cells = [self.cursor]
		self.layer = 2
		if not os.path.exists(self.json_path):
			self.write_changes()
		else:
			self._load_cfg()
		self._backup()

	def select(self):
		if self.cursor in self.used_cells:
			self.used_cells.remove(self.cursor)
		else:
			self.used_cells.append(self.cursor)

	def handle_selection_actions(self, events):
		for event in events:
			if event.type != pygame.KEYUP:
				continue

			if event.key == pygame.K_SPACE: # space key
				self.select()
			elif event.key == pygame.K_DOWN: # down key
				self.cursor += Point(0, 1)
			elif event.key == pygame.K_UP: # up key
				self.cursor += Point(0, -1)
			elif event.key == pygame.K_RIGHT: # right key
				self.cursor += Point(1, 0)
			elif event.key == pygame.K_LEFT: # left key
				self.cursor += Point(-1, 0)
			elif event.key == pygame.K_0: # 0 key
				self.layer = 0
			elif event.key == pygame.K_1: # 1 key
				self.layer = 1
			elif event.key == pygame.K_2: # 2 key
				self.layer = 2
		print_message("Select layer (" + str(self.layer) + ")", cursor=4)

	def write_changes(self):
		cfg = self._get_cfg()
		with open(self.json_path, 'w') as f:
			s = json.dumps(cfg, indent=4, sort_keys=True)
			f.write(s)
		# Save scaled image
		current_size_t = self.current_size.get_tuple_int()
		s = pygame.transform.scale(self.original_image, current_size_t)
		pygame.image.save(s, self.image_path)

	def _get_cfg(self):
		center = get_central_cell()
		return {
			"used_cells": [(cell - center).to_dict() for cell in self.used_cells],
			"offset": self.offset.to_dict(),
			"layer": self.layer
		}

	def _load_cfg(self):
		center = get_central_cell()
		if os.path.exists(self.json_path):
			with open(self.json_path) as json_file:
				json_data = json.load(json_file)
				self.offset = Point(**json_data["offset"])
				self.layer = json_data["layer"]
				self.used_cells = [
					Point(**cell) + center
					for cell in json_data["used_cells"]
				]

	def restore_backup(self):
		shutil.copyfile(self.image_backup_path, self.image_path)
		shutil.copyfile(self.json_backup_path, self.json_path)
		self._load_cfg()

	def _backup(self):
		shutil.copyfile(self.image_path, self.image_backup_path)		
		shutil.copyfile(self.json_path, self.json_backup_path)

	def remove_backup(self):
		os.remove(self.image_backup_path)
		os.remove(self.json_backup_path)


CELL_SIZE = Point(151, 76)
BOARD_SIZE = Point(5, 5)
IMAGE_SIZE = Point(BOARD_SIZE.x*CELL_SIZE.x, BOARD_SIZE.y*CELL_SIZE.y)
BACKUP_EXTENSION = ".backup"

def handle_flow_actions(events, status):
	for event in events:
		# handle every event since the last frame.
		if event.type == pygame.QUIT:
			return QUIT
		elif event.type == pygame.KEYUP:
			# handle actions like quit, previous, continue...
			if event.key == pygame.K_q:
				return QUIT
			elif event.key == pygame.K_r:
				return RESET
			elif event.key == pygame.K_BACKSPACE:
				if status == SEL_MODE:
					return EDIT_MODE
				else:
					return PREVIOUS
			elif event.key == pygame.K_RETURN:
				if status != SEL_MODE:
					print_message("Cell selection mode ON")
					return SEL_MODE
				else:
					return CONTINUE
	return status

def get_central_cell():
	i = (BOARD_SIZE.x_int - 1) / 2
	j = (BOARD_SIZE.y_int - 1) / 2
	return Point(i, j)

def paint_cell(surface, p, color):
	i = p.x; j = p.y
	p1 = Point(i+1.0, j+1.0).to_iso(CELL_SIZE, IMAGE_SIZE)
	p2 = Point(i+1.0, j).to_iso(CELL_SIZE, IMAGE_SIZE)
	p3 = Point(i, j).to_iso(CELL_SIZE, IMAGE_SIZE)
	p4 = Point(i, j+1.0).to_iso(CELL_SIZE, IMAGE_SIZE)
	pygame.draw.polygon(surface, color, [p1, p2, p3, p4])

def draw_base(surface, im, status):
	surface.fill(GRAY)
	center = get_central_cell()
	for i in range(BOARD_SIZE.x_int):
		for j in range(BOARD_SIZE.y_int):
			p = Point(i, j)
			chess_condition = (
				i % 2 == 0 or j % 2 != 0) and (i % 2 != 0 or j % 2 == 0
			)
			if p == im.cursor and status == SEL_MODE:
				paint_cell(surface, p, PINK)
			elif p in im.used_cells and status == SEL_MODE:
				paint_cell(surface, p, RED)
			elif p == center:
				paint_cell(surface, p, BLUE)
			elif chess_condition:
				paint_cell(surface, p, BLACK)

def main_loop(im, reference, screen, clock):
	status = EDIT_MODE
	while True:
		events = list(pygame.event.get())

		status = handle_flow_actions(events, status)

		if status == SEL_MODE:
			im.handle_selection_actions(events)
		elif status == EDIT_MODE:
			im.handle_edit_actions()
			im.print_status()
			reference.handle_edit_actions()
		else:
			return status

		# Display section
		draw_base(screen, im, status)
		im.draw(screen) # draw the sprite to the screen
		reference.draw(screen)
		pygame.display.update() # update the screen
		clock.tick(40)

def print_message(*message, cursor=None):
	global line_count
	if cursor is None:
		cursor = line_count
	sys.stdout.write((line_count - cursor) * REMOVE_PREVIOUS_LINE)
	print(*message)
	line_count = cursor + 1

def get_images(d):
	images = []
	for root, dirs, files in os.walk(d):
		for file_name in files:
			if file_name.endswith(".png"):
				im = Image(file_name, root, EDIT_KEYS)

				images.append(im)

	images.sort(key=lambda im: im.image_path)
	return images

line_count = 0

def main(d):
	images = get_images(d)
	n_images = len(images)

	i = 0
	pygame.init()
	reference = Sprite(REFERENCE_PATH, REFERENCE_KEYS, Point(0, 0))
	screen = pygame.display.set_mode(IMAGE_SIZE.get_tuple_int())
	clock = pygame.time.Clock()
	while i < len(images):
		print_message("Image", i, "of", n_images, cursor=0)
		im = images[i]

		status = main_loop(im, reference, screen, clock)

		if status == CONTINUE:
			im.write_changes()
			i += 1
		elif status == RESET:
			im.restore_backup()
		elif status == PREVIOUS:
			if i == 0:
				im.restore_backup()
			else:
				i -= 1
		elif status == QUIT:
			pygame.quit() # quit the screen
			break

	[image.remove_backup() for image in images]  # Remove all backups
	print_message("Backups removed successfully")

if __name__ == "__main__":
	main(TILES_PATH)
