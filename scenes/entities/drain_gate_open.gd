extends StaticBody2D
class_name DrainGateTrigger

@export var audio_player : AudioComponent

var already_warp : bool = false 
func _on_area_2d_body_entered(body):
	if already_warp:
		queue_free()
	if body is Player && !already_warp:
		var shop_marker : Node = get_tree().get_first_node_in_group("ShopMarker")
		body.global_position = shop_marker.global_position
		already_warp = true
		if audio_player :
			audio_player.play_random()
