extends CharacterBody2D

class_name Player

@export var weapon : Node2D
@export var projectile : Node2D

@export var speed : int = 400

@export var acceleration : int = 1000

@export var deceleration : int = 1000

@export var strength : int = 2

@export var bullet: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
@onready var projectileTimer = $ProjectileTimer

signal pause_menu()

func _input(event):
	handle_attack(event)
	handle_menu(event)
	handle_projectile(event)

func _physics_process(delta):
	handle_movement(delta)

func handle_attack(event):
	if event.is_action_pressed("player_attack"):
		if weapon && weapon.has_method(("attack")):
			weapon.attack(strength)

func handle_projectile(event):
	if event.is_action_pressed("projectile_attack") && projectileTimer.is_stopped():
		var projectile_direction = self.global_position.direction_to(get_global_mouse_position())
		throw_projectile(projectile_direction)

func throw_projectile(projectile_direction : Vector2):
	if bullet:
		var thrown_bullet = bullet.instantiate()
		get_tree().current_scene.add_child(thrown_bullet)
		thrown_bullet.global_position = self.global_position
		thrown_bullet.rotation = projectile_direction.angle()
		projectileTimer.start()

func handle_menu(event):
	if event.is_action_pressed("open_menu"):
		pause_menu.emit()

func handle_movement(delta):
	var input_direction = Input.get_vector(
		"player_move_left",
		"player_move_right", 
		"player_move_up", 
		"player_move_down").normalized()
	velocity = velocity.move_toward(input_direction * speed, acceleration * delta)
	move_and_slide()
