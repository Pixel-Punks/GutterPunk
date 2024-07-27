extends Node2D

class_name ShrinkingSpriteComponent

@export var enemy : Node2D
@export var max_shrink_time : float = 1
@export var shrink_time : float = 0.1
@export var audio_player : AudioComponent

var initial_scale : float
var shrink : bool = true
var enabled : bool = false

func initialize():
	initial_scale = enemy.scale.y
	shrink_time = max_shrink_time/2
	enabled = true
	if randi() % 100 + 1 == 1:
		if audio_player :
			audio_player.play_random()


func reset():
	enemy.scale.y = initial_scale
	enabled = false

func _process(delta):
	if !enabled:
		return
	shrink_time -= delta
	if shrink:
		enemy.scale.y -= delta/4
	else:
		enemy.scale.y += delta/4
	if shrink_time < 0:
		shrink_time = max_shrink_time
		shrink = !shrink
