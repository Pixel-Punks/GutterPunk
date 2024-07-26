extends Area2D

class_name  HitBoxComponent

@export var health_component : HealthComponent

@export var max_timeout : float = 1

@export var timeout : float = 0

func _process(delta):
	if timeout > 0:
		timeout = timeout-delta

func damage(attack):
	if health_component and timeout <= 0:
		timeout = max_timeout
		health_component.damage(attack)
