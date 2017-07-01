extends Control

var tap_start_position

signal user_input

func _check_move(input_vector):
	if input_vector.length() > cnf.MOTION_DISTANCE:
		# Don't needed, but could improve performance?
		input_vector = input_vector.normalized()

		for mouse_direction in cnf.DIRECTIONS:
			# if the distance is smaller than the threshold, try to make a move
			if (mouse_direction.normalized() - input_vector).length() < cnf.MINIMUM_DISTANCE_TO_MOVE:
				var direction = cnf.DIRECTIONS[mouse_direction]
				emit_signal("user_input", direction)
				break

func _input_event(event):
	if event.is_action_pressed("click"):
		# if clicked, save the position
		tap_start_position = event.pos
	elif event.is_action_released("click"):
		# if released, erase de position and check if we can make a move
		_check_move(event.pos - tap_start_position)
		tap_start_position = null
