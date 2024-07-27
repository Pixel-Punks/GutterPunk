extends Node2D

@export var audio_player : AudioComponent

func _on_pickeable_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if audio_player :
			audio_player.play_random()
		var player = body
		player.money += 1
		queue_free()
