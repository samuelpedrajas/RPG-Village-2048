extends Node2D

var level
var token_to_merge_with = null
var current_pos
var tween

signal value_changed

func _ready():
	add_to_group("tokens")
	connect("value_changed", g, "handle_token_increased", [], CONNECT_DEFERRED)

func _spawn_animation():
	# play spawn animation
	get_node("animation").play("spawn")

func setup(pos, t, l):
	tween = t
	current_pos = pos
	level = l
	set_pos(get_parent().map_to_world(pos))
	_set_texture()
	_spawn_animation()
	# set Z properly, so we avoid problems with depth
	_set_Z()

func _increase_value():
	level += 1
	# TODO: NEXT LINE WILL BE REMOVED
	_set_texture()
	emit_signal("value_changed", level)
	# play merge animation
	get_node("animation").play("merge")

func _set_texture():
	get_node("sprite").set_texture(load("res://images/islands/island" + str(level) + ".tex"))

func _interpolated_move(pos):
	var world_current_pos = get_parent().map_to_world(current_pos)

	# length of the difference between the current position and the destination
	var d = (world_current_pos - pos).length()

	# if it's close enough -> time to restore the opacity
	if d < cnf.MERGE_THRESHOLD:
		if get_opacity() < 1:  # must check, otherwise opacity will be set more than once
			set_opacity(1)
		# if it's close enough and flagged as merge -> merge it
		if token_to_merge_with:
			token_to_merge_with._increase_value()
			token_to_merge_with = null
			tween.remove(self, "_interpolated_move")
			queue_free()
			return

	set_pos(pos)

func _define_tweening():
	# get the real world position since destination is a position in the matrix
	var world_pos = get_parent().map_to_world(current_pos)

	# interpolate the position
	tween.interpolate_method(self, "_interpolated_move", get_pos(), world_pos,
							 cnf.ANIMATION_TIME, tween.TRANS_LINEAR, tween.EASE_IN)
	# decrease opacity for a smoother animation
	set_opacity(cnf.MOVEMENT_OPACITY)
	# set Z properly, so we avoid problems with depth
	_set_Z()

func _set_Z():
	set_z(current_pos.x + current_pos.y)
