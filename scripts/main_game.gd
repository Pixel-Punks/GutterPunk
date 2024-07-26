extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var player : Player = load("res://scenes/entities/player.tscn").instantiate()
	add_child(player)
	place_street()

func place_street():
	var scene = load("res://rooms/streets/random_street.tscn").instantiate()
	add_child(scene)
	scene.tree_exited.connect(place_street)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
