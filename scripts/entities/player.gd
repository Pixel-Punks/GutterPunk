extends CharacterBody2D

@export var weapon : Node2D

@export var speed = 400

func _physics_process(_delta):
	handle_attack()
	handle_movement()

func handle_attack():
	if Input.is_action_pressed("player_attack"):
		if weapon && weapon.has_method(("attack")):
			weapon.attack()

func handle_movement():
	var input_direction = Input.get_vector(
		"player_move_left",
		"player_move_right", 
		"player_move_up", 
		"player_move_down")
	velocity = input_direction * speed
	move_and_slide()
