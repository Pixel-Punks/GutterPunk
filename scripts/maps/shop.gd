extends TileMap
class_name Shop

@export var ShopEntrance : Marker2D

@export var item_list : Array[PackedScene]

func _ready():
	var choosen_items = []
	choosen_items.append(item_list.pick_random().instantiate())
	choosen_items.append(item_list.pick_random().instantiate())
	choosen_items.append(item_list.pick_random().instantiate())
	
	var item_markers = get_tree().get_nodes_in_group("ItemMarker")
	var i = 0
	for item_marker in item_markers:
		get_tree().root.add_child(choosen_items[i])
		choosen_items[i].global_position = item_marker.global_position
		print(item_marker.global_position)
		i += 1

func _on_area_2d_body_entered(body):
	if body is Player:
		var drain_gate_marker : Node = get_tree().get_first_node_in_group("DrainGateMarker")
		body.global_position = drain_gate_marker.global_position
