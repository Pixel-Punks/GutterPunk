extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_health_component_flicker():
	set_collision_mask_value(7, false)
	await get_tree().create_timer(0.2).timeout
	set_collision_mask_value(7, true)
