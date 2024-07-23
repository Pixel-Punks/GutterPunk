extends StaticBody2D

class_name Weapon

@export var hurtbox : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hurtbox.disabled = true

func attack():
	hurtbox.disabled = false
	await get_tree().create_timer(0.04).timeout
	#%AttackSprites.play("a")
	hurtbox.disabled = true
