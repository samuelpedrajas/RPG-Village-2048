import pygame
import os
import shutil
from collections import namedtuple

PREVIOUS = -2
RESET = -1
CONTINUE = 2
OK = 1
QUIT = 0

Point = namedtuple('Point', ['x', 'y'])

TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"
CELL_SIZE = Point(151, y=76)
BOARD_SIZE = Point(5, y=7)
IMAGE_SIZE = Point(BOARD_SIZE.x * CELL_SIZE.x,
				   y=BOARD_SIZE.y * CELL_SIZE.y)
WHITE = (255,255,255,150)
RED = (255,0,0,220)
GRAY = (0,0,0,150)

CURSOR_UP_ONE = '\x1b[1A'
ERASE_LINE = '\x1b[2K'

def _draw_base(surface):
	center = Point((BOARD_SIZE.x-1)/2,
				   y=(BOARD_SIZE.y-1)/2)
	for i in range(BOARD_SIZE.y):
		for j in range(BOARD_SIZE.x):
			p1 = (j * CELL_SIZE.x, CELL_SIZE.y / 2 + i * CELL_SIZE.y)
			p2 = (p1[0] + CELL_SIZE.x / 2, p1[1] + CELL_SIZE.y / 2)
			p3 = (p1[0] + CELL_SIZE.x, p1[1])
			p4 = (p1[0] + CELL_SIZE.x / 2, p1[1] - CELL_SIZE.y / 2)
			if Point(j, i) == center:
				pygame.draw.polygon(surface, RED, [p1, p2, p3, p4])
			else:
				pygame.draw.polygon(surface, GRAY, [p1, p2, p3, p4])

class Sprite(object):  # represents the sprite, not the game
	def __init__(self, _path):
		""" The constructor of the class """
		self.image = pygame.image.load(_path)
		self.image.fill((255, 255, 255, 200),
						None, pygame.BLEND_RGBA_MULT)
		# to get the center
		self.w, self.h = self.image.get_rect().size
		self.last_w, self.last_h = (self.w, self.h)
		# the sprite's position
		self.x = int(IMAGE_SIZE.x / 2 - self.w / 2)
		self.y = int(IMAGE_SIZE.y / 2 - self.h / 2)
		self.offset_x = 0
		self.offset_y = 0
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

	def _change_scale(self, key):
		change = 0.01 # distance moved in 1 frame, try changing it to 5
		if key[pygame.K_DOWN]: # down key
			self.scale -= change # move down
		elif key[pygame.K_UP]: # up key
			self.scale += change # move up
		self.scale = min(1.0, self.scale)
		self.scale = max(0.0, self.scale)

	def handle_keys(self):
		""" Handles Keys """
		key = pygame.key.get_pressed()

		if key[pygame.K_LCTRL]:
			self._change_scale(key)
		else:
			self._change_offset(key)

		return OK

	def draw(self, surface):
		""" Draw on surface """
		# blit yourself at your current position
		w = int(self.w * self.scale)
		h = int(self.h * self.scale)
		# recalculate the center
		self.x += (self.last_w / 2) - (w / 2)
		self.y += (self.last_h / 2) - (h / 2)
		self.last_w, self.last_h = (w, h)
		surface.blit(pygame.transform.scale(self.image, (w, h)),
					 (self.x + self.offset_x, self.y + self.offset_y))

	def get_offset(self):
		return self.offset_x, self.offset_y

	def get_scale(self):
		return self.scale

def _main_loop(file_name, directory):
	file_path = os.path.join(directory, file_name)
	pygame.init()
	screen = pygame.display.set_mode(IMAGE_SIZE)

	sprite = Sprite(file_path) # create an instance
	clock = pygame.time.Clock()

	running = True
	while running:
		# handle every event since the last frame.
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				pygame.quit() # quit the screen
				running = False
			elif event.type == pygame.KEYUP:
				if event.key == pygame.K_q:
					return QUIT
				elif event.key == pygame.K_r:
					return RESET
				elif event.key == pygame.K_BACKSPACE:
					return PREVIOUS
				elif event.key == pygame.K_RETURN:
					return CONTINUE

		sprite.handle_keys() # handle the keys

		screen.fill(WHITE)
		_draw_base(screen)
		sprite.draw(screen) # draw the sprite to the screen
		pygame.display.update() # update the screen

		clock.tick(40)

def _restore_backup(file_name, root):
	file_path = os.path.join(root, file_name)
	shutil.copyfile(file_path + ".backup", file_path)

def _backup(file_name, root):
	file_path = os.path.join(root, file_name)
	shutil.copyfile(file_path, file_path + ".backup")

def _print_message(i, l, cursor):
	print(cursor + "Image", i, "of", l)
	cursor = ""

def _main(d):
	file_paths = []
	for root, dirs, files in os.walk(d):
		for file_name in files:
			if file_name.endswith(".png"):
				file_paths.append((file_name, root))

	backup = True

	i = 0
	cursor = ""
	while i < len(file_paths):
		_print_message(i, len(file_paths), cursor)
		(file_name, root) = file_paths[i]
		if backup:
			_backup(file_name, root)
			backup = True

		status = _main_loop(file_name, root)

		if status == CONTINUE:
			i += 1
		elif status == RESET:
			_restore_backup(file_name, root)
			backup = False
		elif status == PREVIOUS:
			if i == 0:
				_restore_backup(file_name, root)
			else:
				i -= 1
			backup = False
		elif status == QUIT:
			print("Exiting...")
			return 1
		cursor = CURSOR_UP_ONE + ERASE_LINE

if __name__ == "__main__":
    _main(TILES_PATH)
