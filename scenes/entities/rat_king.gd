extends CharacterBody2D

@export var collision_layers : PackedInt32Array
@export var mask_layers : PackedInt32Array
@export var velocity_component : VelocityComponent

var target : HitBoxComponent

func _process(_delta):
	if target:
		var attack = Attack.new()
		attack.damage = 20
		target.damage(attack)

func _on_health_component_hp_reached_zero():
	get_tree().change_scene_to_file("res://scenes/menues/start_menu.tscn")

func _on_health_component_took_damage(attack):
	pass

func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		target = area

func _on_area_2d_area_exited(area):
	if area == target:
		target = null
