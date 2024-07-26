extends TileMap

func _on_area_2d_body_entered(body):
	if body is Player:
		body.position.y += 100
		get_parent().get_parent().queue_free()
