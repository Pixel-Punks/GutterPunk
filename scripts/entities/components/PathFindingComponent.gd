extends Node2D

@export var nav : NavigationAgent2D
@export var enemy : CharacterBody2D
@export var max_speed : float = 100
@export var acceleration : float = 1000
@export var velocity_component : VelocityComponent

var target_area

func _ready():
	velocity_component.max_speed = max_speed
	velocity_component.acceleration = acceleration

func _physics_process(delta):
	if target_area :
		nav.target_position = target_area.global_position
	var direction = (nav.get_next_path_position() - global_position).normalized()
	velocity_component.accelerate_in_direction(direction)

func _on_area_2d_body_entered(body):
	if body is Player:
		target_area = body
