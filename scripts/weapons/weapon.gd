extends Node2D

@export var weapon : Weapon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rotate_weapon()

func rotate_weapon():
	look_at(get_global_mouse_position())

func attack(strength : int):
	weapon.attack(strength)
