extends Node2D

class_name PathFindingComponent

@export var nav : NavigationAgent2D
@export var enemy : CharacterBody2D
@export var max_speed : float = 100
@export var acceleration : float = 1000
@export var velocity_component : VelocityComponent
@export var radius : int

signal player_detected
signal player_lost

var player : Player

func _ready():
	velocity_component.max_speed = max_speed
	velocity_component.acceleration = acceleration
	var collision_shape : CollisionShape2D = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = radius
	collision_shape.shape = circle
	%Area2D.add_child(collision_shape)

func _physics_process(_delta):
	if !player :
		return
	var direction = (nav.get_next_path_position() - global_position).normalized()
	velocity_component.accelerate_in_direction(direction)

func start_following():
	if player:
		nav.target_position = player.global_position

func _on_area_2d_body_entered(body):
	if body is Player:
		player = body
		player_detected.emit()

func _on_area_2d_body_exited(body):
	if body is Player:
		player_lost.emit()
		player = null
