extends CharacterBody2D

class_name Player

@export var weapon : Node2D


@export var velocity_component : VelocityComponent

@export var shrinking_sprite : ShrinkingSpriteComponent

@export var oscillating_sprite : OscillatingSpriteComponent

@export var flashing_sprite : FlashingSpriteComponent

@export var speed : int = 400

@export var speed_unit : int = 10

@export var speed_level : int = 0 : 
	get: 
		return speed_level
	set(value):
		speed_level = value
		if velocity_component:
			velocity_component.max_speed = speed + speed_unit * speed_level

@export var acceleration : int = 1000 : 
	get: 
		return acceleration
	set(value):
		acceleration = value
		if velocity_component:
			velocity_component.acceleration = acceleration

@export var deceleration : int = 1000 : 
	get: 
		return deceleration
	set(value):
		deceleration = value
		if velocity_component:
			velocity_component.deceleration = deceleration

@export var strength : int = 2

@export var money : int = 0

signal pause

func _ready():
	velocity_component.max_speed = speed + speed_unit * speed_level
	velocity_component.acceleration = acceleration
	velocity_component.deceleration = deceleration

func _input(event):
	handle_menu(event)

func _physics_process(_delta):
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
		pause.emit()

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
	animate_sprite(input_direction != Vector2.ZERO)

func animate_sprite(is_moving : bool):
	if is_moving:
		if !oscillating_sprite.enabled:
			oscillating_sprite.initialize()
		shrinking_sprite.reset()
	else:
		oscillating_sprite.reset()
		if !shrinking_sprite.enabled:
			shrinking_sprite.initialize()

func weapon_swap(new_weapon):
	remove_child(weapon)
	add_child(new_weapon)
	weapon = new_weapon


func _on_health_component_hp_reached_zero():
	queue_free()
	# TODO GameOver
