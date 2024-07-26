extends CharacterBody2D

class_name Player

@export var weapon : Node2D

@export var speed : int = 400

@export var acceleration : int = 1000

@export var deceleration : int = 1000

@export var strength : int = 2

@export var money : int = 0

signal pause

func _input(event):
	handle_attack(event)
	handle_menu(event)

func _physics_process(delta):
	handle_movement(delta)

func handle_attack(event):
	if event.is_action_pressed("player_attack"):
		if weapon && weapon.has_method(("attack")):
			weapon.attack(strength)

func handle_menu(event):
	if event.is_action_pressed("open_menu"):
		pause.emit()

func handle_movement(delta):
	var input_direction = Input.get_vector(
		"player_move_left",
		"player_move_right", 
		"player_move_up", 
		"player_move_down").normalized()
	velocity = velocity.move_toward(input_direction * speed, acceleration * delta)
	move_and_slide()
