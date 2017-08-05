import pygame
import os
from collections import namedtuple

Point = namedtuple('Point', ['x', 'y'])

TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"
CELL_SIZE = Point(151, y=76)
BOARD_SIZE = Point(5, y=7)
IMAGE_SIZE = Point(BOARD_SIZE.x * CELL_SIZE.x,
				   y=BOARD_SIZE.y * CELL_SIZE.y)
WHITE = (255,255,255,150)
GRAY = (0,0,0,150)

img_path = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/human/street/castles/2.png"

def _draw_base(surface):
	for i in range(BOARD_SIZE.y):
		for j in range(BOARD_SIZE.x):
			p1 = (j * CELL_SIZE.x, CELL_SIZE.y / 2 + i * CELL_SIZE.y)
			p2 = (p1[0] + CELL_SIZE.x / 2, p1[1] + CELL_SIZE.y / 2)
			p3 = (p1[0] + CELL_SIZE.x, p1[1])
			p4 = (p1[0] + CELL_SIZE.x / 2, p1[1] - CELL_SIZE.y / 2)

			pygame.draw.polygon(surface, GRAY, [p1, p2, p3, p4])

class Sprite(object):  # represents the sprite, not the game
	def __init__(self):
		""" The constructor of the class """
		self.image = pygame.image.load(img_path)
		self.image.fill((255, 255, 255, 200),
						None, pygame.BLEND_RGBA_MULT)
		# to get the center
		w, h = self.image.get_rect().size
		# the sprite's position
		self.x = int(IMAGE_SIZE.x / 2 - w / 2)
		self.y = int(IMAGE_SIZE.y / 2 - h / 2)

	def handle_keys(self):
		""" Handles Keys """
		key = pygame.key.get_pressed()
		dist = 1 # distance moved in 1 frame, try changing it to 5
		if key[pygame.K_DOWN]: # down key
			self.y += dist # move down
		elif key[pygame.K_UP]: # up key
			self.y -= dist # move up
		if key[pygame.K_RIGHT]: # right key
			self.x += dist # move right
		elif key[pygame.K_LEFT]: # left key
			self.x -= dist # move left

	def draw(self, surface):
		""" Draw on surface """
		# blit yourself at your current position
		surface.blit(self.image, (self.x, self.y))


pygame.init()
screen = pygame.display.set_mode(IMAGE_SIZE)

sprite = Sprite() # create an instance
clock = pygame.time.Clock()

running = True
while running:
	# handle every event since the last frame.
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			pygame.quit() # quit the screen
			running = False

	sprite.handle_keys() # handle the keys
	screen.fill(WHITE)
	_draw_base(screen)
	sprite.draw(screen) # draw the sprite to the screen
	pygame.display.update() # update the screen

	clock.tick(40)
