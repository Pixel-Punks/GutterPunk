extends Node2D

@export var nav : NavigationAgent2D
@export var enemy : CharacterBody2D

var target_area

func _physics_process(delta):
	if target_area :
		nav.target_position = target_area.global_position
	var direction = (nav.get_next_path_position() - global_position).normalized()
	enemy.velocity = direction * 250
	enemy.move_and_slide()

func _on_area_2d_body_entered(body):
	if body is Player:
		target_area = body
