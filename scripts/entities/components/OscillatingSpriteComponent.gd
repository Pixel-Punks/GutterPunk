extends Node2D

class_name OscillatingSpriteComponent

@export var enemy : Node2D
@export var max_rotation_time : float = 1
@export var rotation_time : float = 0.1

var initial_rotation : float
var left_to_right : bool = true
var enabled : bool = false

func initialize():
	initial_rotation = enemy.rotation
	rotation_time = max_rotation_time/2
	enabled = true


func reset():
	enemy.rotation = initial_rotation
	enabled = false

func _process(delta):
	if !enabled:
		return
	rotation_time -= delta
	if left_to_right:
		enemy.rotation += delta/2
	else:
		enemy.rotation -= delta/2
	if rotation_time < 0:
		rotation_time = max_rotation_time
		left_to_right = !left_to_right
