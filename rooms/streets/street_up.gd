extends TileMap

func _on_area_2d_body_entered(body):
	get_parent().get_parent().queue_free()
