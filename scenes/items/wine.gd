extends Node2D

@onready var interaction_area : InteractionArea = $InteractionArea
@export var audio_player : AudioComponent

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if audio_player :
		audio_player.play_random()
	queue_free()
