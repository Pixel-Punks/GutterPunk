extends Node2D

@export var nav : NavigationAgent2D
@export var enemy : CharacterBody2D

var target_area

func _physics_process(delta):
	if target_area :
		nav.target_position = target_area.global_position
		print_debug(nav.target_position)
	var direction = (nav.get_next_path_position() - global_position).normalized()
	enemy.translate(direction * 200 * delta)


func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		target_area = area
