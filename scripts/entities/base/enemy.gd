extends CharacterBody2D

func _on_health_component_hp_reached_zero():
	queue_free()

func _on_health_component_took_damage(attack):
	pass # Replace with function body.
