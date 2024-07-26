extends Node2D

@onready var drop = preload("res://scenes/entities/coin.tscn")

func _on_tree_exiting():
	print("here exiting")
	var parent = get_parent()
	print(parent)
	var coin = drop.instantiate()
	print(coin)
	var pos = parent.global_position
	print(pos)
	parent = parent.get_parent()
	print(parent)
	#parent.add_child(coin)
	get_tree().root.add_child(coin)
	coin.global_position = global_position
	coin.z_index = 10
