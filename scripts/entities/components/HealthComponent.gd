extends Node2D

class_name HealthComponent

@export var MAX_HEALTH : int = 100

@export var health_bar : ProgressBarUi

signal hp_reached_zero()
signal took_damage(attack : Attack)
signal flicker()

var health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH
	if health_bar:
		health_bar.update_health(health)

func damage(attack : Attack):
	health -= attack.damage
	flicker.emit()
	if health_bar:
		health_bar.update_health(health)
	await get_tree().create_timer(0.2).timeout
	if health <= 0:
		hp_reached_zero.emit()
		return
	took_damage.emit(attack)
