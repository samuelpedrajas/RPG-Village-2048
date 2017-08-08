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
