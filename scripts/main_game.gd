extends Node2D

@export var small_streets : int = -1
@export var big_streets : int = -1
@export var boss_room_height : int = 18
@export var boss_room_width : int = 18
var player_character : Player
# Called when the node enters the scene tree for the first time.
func _ready():
	var player : Player = load("res://scenes/entities/player.tscn").instantiate()
	add_child(player)
	self.player_character = player
	place_small_street()

func place_small_street():
	var scene = load("res://rooms/streets/random_small_street.tscn").instantiate()
	add_child(scene)
	small_streets -=1
	if small_streets >= 0:
		scene.tree_exited.connect(place_small_street)
	else:
		scene.tree_exited.connect(place_big_street)
	
func place_big_street():
	var scene = load("res://rooms/streets/random_big_street.tscn").instantiate()
	add_child(scene)
	big_streets -=1
	if big_streets >= 0:
		scene.tree_exited.connect(place_big_street)
	else:
		scene.tree_exited.connect(place_boss_room)
		
func place_boss_room():
	var scene = load("res://rooms/streets/boss/boss_room.tscn").instantiate()
	add_child(scene)
	player_character.position = Vector2(16*5*boss_room_width/2,boss_room_height*15*5)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
