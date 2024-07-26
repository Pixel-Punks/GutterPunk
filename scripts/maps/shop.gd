extends TileMap
class_name Shop

@export var ShopEntrance : Marker2D


func _on_area_2d_body_entered(body):
	if body is Player:
		var drain_gate_marker : Node = get_tree().get_first_node_in_group("DrainGateMarker")
		body.global_position = drain_gate_marker.global_position
