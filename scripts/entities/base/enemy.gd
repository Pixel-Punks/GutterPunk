extends CharacterBody2D

@export var collision_layers : PackedInt32Array
@export var mask_layers : PackedInt32Array

func _ready():
	for n in range(1,33):
		set_collision_layer_value(n, collision_layers.find(n) >= 0)
	for n in range(1,33):
		set_collision_mask_value(n, mask_layers.find(n) >= 0)

func _on_health_component_hp_reached_zero():
	queue_free()

func _on_health_component_took_damage(attack):
	velocity = velocity.move_toward(attack.direction * attack.knockback* 100, 1000)
	move_and_slide()
