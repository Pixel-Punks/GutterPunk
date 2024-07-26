extends Node2D

class_name Weapon

@export var hurtbox : CollisionPolygon2D
@export var animated_sprites : AnimatedSprite2D

@export var weapon_attack : Attack

var attack_strength : int = 1

var animation_names : PackedStringArray
var animation_index : int = 0
var max_animation_index : int = 0

var collided_hitboxes : Array[RID]

func _ready():
	animation_names = animated_sprites.sprite_frames.get_animation_names()
	max_animation_index = animation_names.size()
	collided_hitboxes = []

func _process(_delta):
	if animated_sprites.is_playing():
		hurtbox.disabled = false
	else:
		hurtbox.disabled = true

func attack(strength : int):
	if animated_sprites.is_playing():
		return
	attack_strength = strength
	collided_hitboxes.clear()
	animated_sprites.play(animation_names[animation_index])
	animation_index = (animation_index + 1) % max_animation_index

func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		if collided_hitboxes.find(area.get_rid()) >= 0:
			return
		collided_hitboxes.append(area.get_rid())
		weapon_attack.direction = Vector2.RIGHT.rotated(get_parent().transform.get_rotation())
		hitbox.damage(weapon_attack)
