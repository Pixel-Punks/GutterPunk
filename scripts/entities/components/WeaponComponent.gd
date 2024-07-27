extends Node2D

class_name Weapon

@export var hurtbox : CollisionPolygon2D
@export var animated_sprites : AnimatedSprite2D
@export var non_damaging_frames : Array[int] = []

@export var weapon_attack : Attack
@export var audio_player : AudioComponent

var attack_strength : int = 1

var animation_names : PackedStringArray
var animation_index : int = 0
var max_animation_index : int = 0

var attack_timeout : float = 0

var collided_hitboxes : Array[RID]

func _ready():
	animation_names = animated_sprites.sprite_frames.get_animation_names()
	max_animation_index = animation_names.size()
	collided_hitboxes = []

func _process(delta):
	if animated_sprites.is_playing() && non_damaging_frames.find(animated_sprites.frame) == -1:
		hurtbox.disabled = false
	else:
		hurtbox.disabled = true
		if attack_timeout > 0:
			attack_timeout = (attack_timeout - delta)

func attack(strength : int):
	if attack_timeout > 0:
		return
	attack_timeout = 1 / weapon_attack.attacks_per_seconds
	weapon_attack.strength = strength
	collided_hitboxes.clear()
	animated_sprites.play(animation_names[animation_index])
	animation_index = (animation_index + 1) % max_animation_index

func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		if collided_hitboxes.find(area.get_rid()) >= 0:
			return
		collided_hitboxes.append(area.get_rid())
		weapon_attack.direction = (area.global_position - get_parent().global_position).normalized()
		hitbox.damage(weapon_attack)
		if audio_player :
			audio_player.play_random()
