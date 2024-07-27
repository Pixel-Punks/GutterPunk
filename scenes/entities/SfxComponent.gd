extends Node2D

class_name AudioComponent

@export var audio_players : Array[AudioStreamWAV] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_random():
	var path = audio_players[randi() % audio_players.size()].get_path()
	AudioStreamManager.play(path)
