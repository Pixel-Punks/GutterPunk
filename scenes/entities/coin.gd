extends Node2D

func _on_pickeable_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player = body
		player.money += 1
		queue_free()
