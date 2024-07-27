extends State

class_name RatAttack

@export var pathfinding : PathFindingComponent
@export var body : CharacterBody2D
@export var claw : Weapon
@export var bite : Weapon
@export var attack_range : float = 32*5
var claw_attack : bool = false
var is_attacking : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	bite.animated_sprites.animation_finished.connect(attack_end)
	claw.animated_sprites.animation_finished.connect(attack_end)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enter():
	pass

func switch_to_follow():
	Transitioned.emit(self, "follow")
	
func update(_delta):
	if !pathfinding.player:
		return
	if pathfinding.player.global_position.distance_to(body.global_position) > attack_range:
		switch_to_follow()
		return
	if is_attacking:
		return
	
	is_attacking = true
	if claw_attack:
		claw.look_at(pathfinding.player.global_position)
		claw.visible = true
		claw.attack(1)
	else:
		bite.look_at(pathfinding.player.global_position)
		bite.visible = true
		bite.attack(1)
	claw_attack = !claw_attack

func attack_end():
	await get_tree().create_timer(0.5).timeout
	claw.visible = false
	bite.visible = false
	await get_tree().create_timer(0.5).timeout
	is_attacking = false
