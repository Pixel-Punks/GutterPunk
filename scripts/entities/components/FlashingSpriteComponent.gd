extends Node2D

class_name FlashingSpriteComponent

@export var sprite : Sprite2D

func _on_health_component_took_damage(_attack : Attack):
	var tween: Tween = create_tween()
	tween.tween_property(sprite, "modulate:v", 1, 0.1).from(15)
	await get_tree().create_timer(0.15).timeout
	tween = create_tween()
	tween.tween_property(sprite, "modulate:v", 1, 0.1).from(15)
