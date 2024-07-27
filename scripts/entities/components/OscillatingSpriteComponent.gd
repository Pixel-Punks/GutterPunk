extends Node2D

class_name OscillatingSpriteComponent

@export var enemy : Node2D
@export var max_rotation_time : float = 1
@export var rotation_time : float = 0.1
@export var rotation_speed : float = 2
@export var rotation_duration : float = 0.25

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
	rotation_time -= delta*(1/rotation_duration)
	if left_to_right:
		enemy.rotation += delta/(1/rotation_speed)
	else:
		enemy.rotation -= delta/(1/rotation_speed)
	if rotation_time < 0:
		rotation_time = max_rotation_time
		left_to_right = !left_to_right
