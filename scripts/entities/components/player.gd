extends CharacterBody2D

class_name Player

@export var weapon : Node2D

@export var speed : int = 400

@export var acceleration : int = 1000

@export var strength : int = 2

@export var velocity_component : VelocityComponent

signal pause_menu()

func _ready():
	velocity_component.max_speed = speed
	velocity_component.acceleration = acceleration

func _input(event):
	handle_menu(event)

func _physics_process(delta):
	handle_movement()
	handle_attack()
	if Input.is_action_pressed("interact"):
		var new_weapon = load("res://scenes/weapons/pipe.tscn").instantiate()
		weapon_swap(new_weapon)

func handle_attack():
	if Input.is_action_pressed("player_attack"):
		if weapon && weapon.has_method(("attack")):
			weapon.attack(strength)

func handle_menu(event):
	if event.is_action_pressed("open_menu"):
		pause_menu.emit()

func handle_movement():
	var input_direction = Input.get_vector(
		"player_move_left",
		"player_move_right", 
		"player_move_up", 
		"player_move_down").normalized()
	if input_direction == Vector2.ZERO:
		velocity_component.decelerate()
	else:
		velocity_component.accelerate_in_direction(input_direction)
	move_and_slide()

func weapon_swap(new_weapon):
	remove_child(weapon)
	add_child(new_weapon)
	weapon = new_weapon
