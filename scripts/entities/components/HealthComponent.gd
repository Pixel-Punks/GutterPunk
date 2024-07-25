extends Node2D

class_name HealthComponent

@export var MAX_HEALTH : int = 10

signal hp_reached_zero()
signal took_damage(attack : Attack)

var health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

func damage(attack : Attack):
	health -= attack.damage
	took_damage.emit(attack)
	health = health % MAX_HEALTH
	if health == 0:
		hp_reached_zero.emit()
