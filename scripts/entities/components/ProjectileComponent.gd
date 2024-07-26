extends Node2D

class_name ProjectileComponent

@export var hurtbox : CollisionPolygon2D
@export var sprite : Sprite2D
@export var speed : int 
@export var projectile_attack : Attack

var attack_strength : int = 1

var collided_hitboxes : Array[RID]


func _ready():
	collided_hitboxes = []


func _process(delta):
	var direction = Vector2.RIGHT.rotated(global_rotation)
	global_position += speed * direction * delta


func attack(strength : int):
	attack_strength = strength
	collided_hitboxes.clear()


func _on_area_2d_area_entered(area):
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		if collided_hitboxes.find(area.get_rid()) >= 0:
			return
		collided_hitboxes.append(area.get_rid())
		hitbox.damage(projectile_attack)
		queue_free()


func _on_area_2d_body_entered(body):
	queue_free()
