extends CharacterBody2D

@export var weapon : Weapon

@export var speed = 400

func _physics_process(delta):
	rotate_weapon()
	handle_attack()
	handle_movement(delta)

func rotate_weapon():
	%Hand.look_at(get_global_mouse_position())

func handle_attack():
	if Input.is_action_pressed("player_attack"):
		weapon.attack()

func handle_movement(delta):
	var input_direction = Input.get_vector(
		"player_move_left",
		"player_move_right", 
		"player_move_up", 
		"player_move_down")
	velocity = input_direction * speed
	move_and_slide()
