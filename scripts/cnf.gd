extends Node

# Directions available for input
const DIRECTIONS = {
	Vector2(2 / sqrt(5), 1 / sqrt(5)): Vector2(1, 0), 
	Vector2(-2 / sqrt(5), -1 / sqrt(5)): Vector2(-1, 0),
	Vector2(2 / sqrt(5), -1 / sqrt(5)): Vector2(0, -1),
	Vector2(-2 / sqrt(5), 1 / sqrt(5)): Vector2(0, 1)
}

const ANIMATION_TIME = 0.1  # time to travel to the destination, in seconds
const MERGE_THRESHOLD = 20  # in pixels, distance to the destination to perform a merge
const MOVEMENT_OPACITY = 0.2  # opacity when moving

const MOTION_DISTANCE = 15  # Minimum distance with the mouse pressed to make a move
const MINIMUM_DISTANCE_TO_MOVE = 0.6  # Minimum distance from the 8 direction vectors to make a move
