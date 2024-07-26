extends Node2D

@export var small_streets : int = 3
@export var big_streets : int = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	var player : Player = load("res://scenes/entities/player.tscn").instantiate()
	add_child(player)
	place_small_street()

func place_small_street():
	var scene = load("res://rooms/streets/random_small_street.tscn").instantiate()
	add_child(scene)
	small_streets -=1
	if small_streets > 0:
		scene.tree_exited.connect(place_small_street)
	else:
		scene.tree_exited.connect(place_big_street)
	
func place_big_street():
	var scene = load("res://rooms/streets/random_big_street.tscn").instantiate()
	add_child(scene)
	big_streets -=1
	if big_streets > 0:
		scene.tree_exited.connect(place_big_street)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
