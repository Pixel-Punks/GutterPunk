extends Node2D

class_name HealthComponent

@export var MAX_HEALTH := 10
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

func damage(attack):
	pass