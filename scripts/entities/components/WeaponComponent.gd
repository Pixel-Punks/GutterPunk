extends Node2D

class_name Weapon

@export var hurtbox : CollisionPolygon2D
@export var animated_sprites : AnimatedSprite2D

var animation_names : PackedStringArray
var animation_index : int = 0
var max_animation_index : int = 0

func _ready():
	animation_names = animated_sprites.sprite_frames.get_animation_names()
	max_animation_index = animation_names.size()

func _process(_delta):
	if animated_sprites.is_playing():
		hurtbox.disabled = false
	else:
		hurtbox.disabled = true

func attack():
	if animated_sprites.is_playing():
		return
	animated_sprites.play(animation_names[animation_index])
	animation_index = (animation_index + 1) % max_animation_index


func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		var attackObject = Attack.new()
		attackObject.damage = 1
		hitbox.damage(attackObject)
