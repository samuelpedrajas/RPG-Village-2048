import PIL.ImageDraw as ImageDraw
import PIL.Image as Image
import os, json
from math import ceil
from collections import namedtuple

Point = namedtuple('Point', ['x', 'y'])
TILES_PATH = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/"
CELL_SIZE = Point(151, y=76)
BOARD_SIZE = Point(5, y=7)
IMAGE_SIZE = Point(BOARD_SIZE.x * CELL_SIZE.x,
				   y=BOARD_SIZE.y * CELL_SIZE.y)
WHITE = (255,255,255,150)
GRAY = (0,0,0,150)


def _create_new_background():
	image = Image.new("RGBA", (IMAGE_SIZE.x,
					  IMAGE_SIZE.y), color=WHITE)
	draw = ImageDraw.Draw(image)

	for i in range(BOARD_SIZE.y):
		for j in range(BOARD_SIZE.x):
			p1 = (j * CELL_SIZE.x, CELL_SIZE.y / 2 + i * CELL_SIZE.y)
			p2 = (p1[0] + CELL_SIZE.x / 2, p1[1] + CELL_SIZE.y / 2)
			p3 = (p1[0] + CELL_SIZE.x, p1[1])
			p4 = (p1[0] + CELL_SIZE.x / 2, p1[1] - CELL_SIZE.y / 2)

			draw.polygon((p1, p2, p3, p4), fill=GRAY)
	return image

def _paste_image(image_path, image):
	im = Image.open(ex)
	w, h = im.size
	c = (
		int(IMAGE_SIZE.x / 2 - w / 2),
		int(IMAGE_SIZE.y / 2 - h / 2)
	)
	image.paste(im, (c[0], c[1], c[0] + w, c[1] + h), mask=im)

ex = "/home/samuel/Godot Projects/RPG-Village-2048/RPG Village 2048/Assets/human/street/buildings/1.png"

image = _create_new_background()
_paste_image(ex, image)
image.show()
