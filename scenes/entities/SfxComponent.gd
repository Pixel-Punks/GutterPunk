extends Node2D

class_name AudioComponent

@export var audio_players : Array[AudioStreamPlayer2D] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_random():
	audio_players[randi() % audio_players.size()].play()
