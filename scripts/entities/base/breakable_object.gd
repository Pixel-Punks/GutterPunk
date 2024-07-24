extends StaticBody2D

func _on_health_component_hp_reached_zero():
	queue_free()
