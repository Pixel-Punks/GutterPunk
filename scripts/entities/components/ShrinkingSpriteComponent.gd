extends Node2D

class_name ShrinkingSpriteComponent

@export var enemy : Node2D
@export var max_shrink_time : float = 1
@export var shrink_time : float = 0.1
@export var audio_player : AudioComponent
@export var shrink_speed : float = 0.25
@export var shrink_duration : float = 1

var initial_scale : float
var shrink : bool = true
var enabled : bool = false

func initialize():
	initial_scale = enemy.scale.y
	shrink_time = max_shrink_time/2
	enabled = true
	if audio_player :
		audio_player.play_random()


func reset():
	enemy.scale.y = initial_scale
	enabled = false

func _process(delta):
	if !enabled:
		return
	shrink_time -= delta*(1/shrink_duration)
	if shrink:
		enemy.scale.y -= delta/(1/shrink_speed)
	else:
		enemy.scale.y += delta/(1/shrink_speed)
	if shrink_time < 0:
		shrink_time = max_shrink_time
		shrink = !shrink
