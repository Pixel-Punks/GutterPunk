extends Node2D

class_name VelocityComponent

@export var max_speed : float = 0
@export var acceleration : float = 0
@export var deceleration : float = 0
@export var knockback_sensibility : float = 1
@export var body : CharacterBody2D

func accelerate_in_direction(
	direction : Vector2, 
	movement_acc : float = acceleration, 
	knockback : Vector2 = Vector2.ZERO,
	delta : float = get_process_delta_time()
	):
	body.velocity = body.velocity.move_toward(
		direction*max_speed*10, 
		movement_acc*delta*100) + knockback
	body.move_and_slide()

func knockback_in_direction(
	direction : Vector2, 
	knockback_factor : int, 
	_delta : float = get_process_delta_time()
	):
	accelerate_in_direction(direction, acceleration, direction*knockback_factor*10*max_speed)
	
func decelerate(_delta : float = get_process_delta_time()):
	accelerate_in_direction(Vector2.ZERO, deceleration)
