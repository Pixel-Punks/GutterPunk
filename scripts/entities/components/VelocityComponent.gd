extends Node2D

class_name VelocityComponent

@export var max_speed : float = 0
@export var acceleration : float = 0
@export var deceleration : float = 0
@export var body : CharacterBody2D

func accelerate_in_direction(
	direction : Vector2, 
	movement_acc : float = acceleration, 
	knockback : Vector2 = Vector2.ZERO,
	delta : float = get_process_delta_time()
	):
	body.velocity = body.velocity.move_toward(
		direction * max_speed, 
		acceleration * delta) + knockback
	body.move_and_slide()

func knockback_in_direction(
	direction : Vector2, 
	knockback_factor : int, 
	delta : float = get_process_delta_time()
	):
	accelerate_in_direction(direction, acceleration, direction*knockback_factor*max_speed)
	
func decelerate(delta : float = get_process_delta_time()):
	accelerate_in_direction(Vector2.ZERO, deceleration)
